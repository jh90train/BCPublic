# ##############################################################################
# Script      : Script Assistant Patching
# Date        : 01/30/2023
# Author      : Jason Holstrom
# Comment     : Patch integration (Patch list integration)
# ##############################################################################

# #############################################################################
@SageX3AutomatedTestPlatform
Feature: FEATURE ATP_PATCH
    # #############################################################################

    # #############################################################################
    Scenario: Connection
        # #############################################################################

        # Connection
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

    # #############################################################################
    Scenario: Function Patch integration (Patch list integration)
        # #############################################################################

        Given the user opens the "Patch" function
        Then the modal dialog "Patch list integration" is displayed

        And the user selects the radio buttons group with name: "Destination type"
        And the user clicks on "Server" radio button of the selected radio buttons group
        Then the radio button "Server" of the selected radio buttons group is selected

        # Field : Patch (Screen : PATCH / VOLFIL) (Data type : ASTO Alphanumeric None ) (Options : ) ()
        Given the user selects the text field with name: "Patch"
        When the user writes "[PATCH]" to the selected text field
        And the user hits tab

        When the user selects the check box with name: "Patch integration"
        And the user sets the check box to ticked

        When the user selects the check box with name: "Comment overwrite"
        And the user sets the check box to ticked

        When the user selects the check box with name: "Deferred validation"
        And the user sets the check box to unticked

        When the user selects the check box with name: "Link synchronization"
        And the user sets the check box to unticked

        Given the user selects the data table in the popup

        Then the user selects row that has the text "X3" in column with header: "Folder"
        And the user opens "Delete" function on toolbox of the selected row


        # Exit Table
        And the user hits enter
        And the user waits 10 seconds
        And the user clicks the "Ok" option in the alert box

        And the user waits 60 seconds
        And the user waits 60 seconds

        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

        And the user clicks the "Yes" option in the alert box

        Then the user clicks the Close page action icon on the header panel

    # #############################################################################
    Scenario: Disconnection
        # #############################################################################

        # Disconnection
        And the user logs-out from the system

