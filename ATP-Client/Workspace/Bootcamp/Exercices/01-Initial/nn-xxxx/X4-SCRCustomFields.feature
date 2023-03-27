# ##############################################################################
# Script      : ATP_GESATB_OATB
# Date        : 03/09/23 18:35:54
# Author      : Administrateur système (ADMIN)
# Comment     : Table dictionary (Table dictionary)
# Version     : 2.9.05
# ##############################################################################

# #############################################################################
@SageX3AutomatedTestPlatform
Feature: FEATURE ATP_GESATB_OATB
    # #############################################################################

    # #############################################################################
    Scenario: Connection
        # #############################################################################

        # Connection
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

        Given the user opens the "GESAMK" function
        Then the "Screen dictionary" screen is displayed

    Scenario Outline: Screen Update
        # #############################################################################

        # Field : Screen code (Screen : AMK0 / CODMSK) (Data type : AMK Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Screen code"
        When the user writes <SCREENNAME> to the selected text field

        # #############################################################################

        And the user clicks the "Fields" tab selected by title

        # Table : (Screen : AMK2 / NBLIG) (Options : KARIDBCS1T)
        Given the user selects the fixed data table for x3 field name: "AMK2_ARRAY_NBLIG"

        # Field : Field (Screen : AMK2 / CODZON) (Data type : AVA Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        When the user selects last fixed cell with header: "Field"
        Then the user adds the text <CODZON> in selected cell

        # Field : Block (Screen : AMK2 / NUMBLOC) (Data type : C Short integer None ) (Options : z+) () (!! Mandatory field !!)
        When the user selects last editable cell with column header: "Block"
        Then the user adds the text <NUMBLOC> in selected cell

        # Field : Position (Screen : AMK2 / NOZONE) (Data type : DCB Decimal None ) (Options : Fz+) () (!! Mandatory field !!)
        When the user selects last editable cell with column header: "Position"
        Then the user adds the text <NOZONE> in selected cell
        And the user hits enter


        When the user clicks the "Save" main action button on the right panel
        And the user waits 3 seconds

        And the user clicks the "Validation" button in the header

        And the user clicks the "Yes" opinion in the alert box


        Examples:
            | SCREENNAME | CODZON    | NUMBLOC | NOZONE |
            | "ITF2"     | "ZITFFLD" | "1"     | "1.3"  |
            | "BPC0"     | "ZBPCFLD" | "1"     | "1.3"  |
            | "BPS0"     | "ZBPSFLD" | "1"     | "1.3"  |
            | "ITS"      | "ZITSFLD" | "1"     | "1.3"  |


    # #############################################################################
    Scenario: End Scenario Outline
        # #############################################################################

        Then the user clicks the Close page action icon on the header panel

    # #############################################################################
    Scenario: Disconnection
        # #############################################################################

        # Disconnection
        And the user logs-out from the system

