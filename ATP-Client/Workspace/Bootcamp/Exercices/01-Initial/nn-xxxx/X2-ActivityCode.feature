# ##############################################################################
# Script      : X2-ActivityCode
# Date        : 03/09/23 18:17:07
# Author      : Jason Holstrom
# Comment     : Activity codes (Activity codes)
# ##############################################################################

# #############################################################################
@SageX3AutomatedTestPlatform
Feature: FEATURE Create Custom Activity Code
    # #############################################################################

    # #############################################################################
    Scenario: Connection
        # #############################################################################

        # Connection
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

    # #############################################################################
    Scenario: Create Activity code
        # #############################################################################

        Given the user opens the "GESACV" function
        Then the "Activity codes" screen is displayed

        # Field : Activity code (Screen : ACV2 / CODACT) (Data type : ACV Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Activity code"
        When the user writes "ZOH" to the selected text field
        And the user hits tab

        # Field : Activity code (Screen : ACV2 / CODACT) (Data type : ACV Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Activity code"
        When the user writes "ZACT1" to the selected text field

        # Field : Description (Screen : ACV2 / ZLIBACT) (Data type : ATT Alphanumeric None ) (Options : ) ()
        Given the user selects the text field with name: "Description"
        When the user writes "Presales demo" to the selected text field

        # Field : Active (Screen : ACV2 / FLACT) (Data type : M1 Local menu Check box ) (Options : ) ()
        Given the user selects the check box with name: "Active"
        Then the user sets the check box to ticked

        # Field : Module (Screen : ACV2 / MODULE) (Data type : M14 Local menu None ) (Options : ) ()
        Given the user selects the drop down list with name: "Module"
        When the user clicks on option that matches exact with the text "Supervisor" of the selected drop down list

        # Field : Type (Screen : ACV2 / TYP) (Data type : M93 Local menu Buttons (Vc) ) (Options : ) ()
        Given the user selects the radio buttons group with name: "Type"
        When the user clicks on "Functional" radio button of the selected radio buttons group

        # Field : Dependency (Screen : ACV2 / DEP) (Data type : M74 Local menu Buttons (Vc) ) (Options : ) ()
        Given the user selects the radio buttons group with name: "Dependency"
        When the user clicks on "None" radio button of the selected radio buttons group
        Then the radio button "None" of the selected radio buttons group is selected


        # Button Create
        When the user clicks the "Create" main action button on the right panel
        And the user waits 1 seconds

        Then an alert box with the text "Continue and confirm the duplication?" appears
        And the user clicks the "Yes" opinion in the alert box

        Then a confirmation dialog appears with the message "Record has been created"


    # #############################################################################
    Scenario: Close page
        # #############################################################################

        Then the user clicks the Close page action icon on the header panel

    # #############################################################################
    Scenario: Disconnection
        # #############################################################################

        # Disconnection
        And the user logs-out from the system

