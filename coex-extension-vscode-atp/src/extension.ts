// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
import { EOL } from "os";
import * as path from "path";
import * as vscode from "vscode";

// This method is called when your extension is activated
// Your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {
  // Use the console to output diagnostic information (console.log) and errors (console.error)
  // This line of code will only be executed once when your extension is activated
  console.log(
    'Congratulations, your extension "coex-extension-vscode-atp" is now active!'
  );

  // The command has been defined in the package.json file
  // Now provide the implementation of the command with registerCommand
  // The commandId parameter must match the command field in package.json
  let disposable = vscode.commands.registerCommand(
    "coex-extension-vscode-atp.ExecuteFeature",
    async () => {
      // The code you place here will be executed every time your command is executed
      // Display a message box to the user
      vscode.window.showInformationMessage(
        "Execute feature from coex-extension-vscode-atp!"
      );

      // vscode.workspace
      //   .openTextDocument()
      //   .then((value: vscode.TextDocument) =>
      //     vscode.window.showInformationMessage(
      //       `# opendocument: ${value.fileName}`
      //     )
      //   );

      const fileFullname = vscode.window.activeTextEditor?.document.fileName;
      if (!fileFullname) {
        vscode.window.showErrorMessage("No file opened to execute");
        return;
      }
      const filePath = path.parse(fileFullname);
      //fileName = JSON.stringify(fileName);

      if (!filePath) {
        vscode.window.showErrorMessage("No file opened to execute");
        return;
      }
      let terminal = vscode.window.createTerminal("COEX terminal");

      terminal.show();
      //terminal.sendText("dir", true);
      // terminal.sendText(
      //   `# vscode.workspace.name: ${vscode.workspace.name}`,
      //   true
      // );

      // terminal.sendText(
      //   '$Env:RELATIVE_EXEC_PATH = "/Workspace/Bootcamp/Scripts-with-user-config/*.feature"',
      //   true
      // );
      // terminal.sendText(
      //   `$Env:RELATIVE_EXEC_PATH = "${
      //     filePath.dir + path.sep + filePath.base
      //   }"`,
      //   true
      // );
      const fileUriRead = vscode.window.activeTextEditor?.document.uri;
      const eol = vscode.window.activeTextEditor?.document.eol;
      const eolChar = eol === vscode.EndOfLine.LF ? "\n" : "\r\n";
      if (!fileUriRead) {
        vscode.window.showErrorMessage("Error reading file opened");
        return;
      }

      const readData = await vscode.workspace.fs.readFile(fileUriRead);

      const readStr = Buffer.from(readData).toString("utf8");
      if (!eol) {
        vscode.window.showErrorMessage("File without end of line");
        return;
      }

      let array = readStr.split(eolChar);
      const coexHeader = array.filter(
        (line) => line.startsWith("#COEX") === true
      );
      let header = true;
      let headerVars = new Array<string>(50);
      let nbHeadersVars = 0;
      let c: Array<string>;

      coexHeader.forEach((line) => {
        c = line.split("|");

        c[0] = c[0].trimStart();
        c[0] = c[0].trimEnd();
        // console.log(c);
        if (c[0] === "#COEX") {
          if (header) {
            header = false;
            nbHeadersVars = 1;
            while (c[nbHeadersVars]) {
              c[nbHeadersVars] = c[nbHeadersVars].trimStart();
              c[nbHeadersVars] = c[nbHeadersVars].trimEnd();
              c[nbHeadersVars] = c[nbHeadersVars].split(":")[1];
              headerVars[nbHeadersVars - 1] = c[nbHeadersVars];

              //console.log(headerVars[nbHeadersVars - 1]);
              nbHeadersVars += 1;
            }
          } else {
            for (let i = 1; i < c.length; i++) {
              // 0= #COEX
              if (!headerVars[i - 1]) {
                break;
              }
              terminal.sendText(`$Env:${headerVars[i - 1]} = ${c[i]}`, true);
            }
            terminal.sendText(`$Env:FEATURE_TO_RUN = "${filePath.base}"`, true);

            terminal.sendText("npm run cloud-chrome", true);
          }
        }
      });
    }
  );

  context.subscriptions.push(disposable);
}

// This method is called when your extension is deactivated
export function deactivate() {}
