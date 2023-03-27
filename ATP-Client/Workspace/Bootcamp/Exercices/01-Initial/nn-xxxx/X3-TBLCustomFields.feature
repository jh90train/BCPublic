# ##############################################################################
# Script      : X3-AddCustomFields
# Date        : 03/09/23 18:35:54
# Author      : Jason Holstrom
# Comment     : Add Custom Fields to tables
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

    # #############################################################################
    Scenario: Creation Object Table dictionary
        # #############################################################################

        Given the user opens the "GESATB" function
        Then the "Table dictionary" screen is displayed

    Scenario Outline: Table ATB2_ARRAY_NBZONE
        # #############################################################################

        # Field : Table code (Screen : ATB0 / CODFIC) (Data type : ATB Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Table code"
        When the user writes <TBLNAME> to the selected text field
        And the user hits tab

        # #############################################################################
        And the user clicks the "Columns" tab selected by title

        #Then the user hits escape
        # Table : (Screen : ATB2 / NBZONE) (Options : SKARIDB1C+T?)
        Given the user selects the fixed data table for x3 field name: "ATB2_ARRAY_NBZONE"

        # Field : Column (Screen : ATB2 / CODZONE) (Data type : AVA Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        When the user selects last fixed cell with header: "Column"
        Then the user adds the text <CODZONE> in selected cell

        # Field : Type (Screen : ATB2 / CODTYP) (Data type : ATY Alphanumeric None ) (Options : A#) () (!! Mandatory field !!)
        When the user selects last editable cell with column header: "Type"
        Then the user adds the text <CODTYP> in selected cell
        And the user hits tab

        # Field : Length (Screen : ATB2 / LONG) (Data type : DCB Decimal None ) (Options : z+F) ()
        When the user selects last editable cell with column header: "Length"
        Then the user adds the text <LONG> in selected cell

        # Field : Dim. (Screen : ATB2 / DIME) (Data type : C Short integer None ) (Options : z+) () (!! Mandatory field !!)
        When the user selects last editable cell with column header: "Dim."
        Then the user adds the text <DIME> in selected cell

        # Field : Normal title (Screen : ATB2 / INTITCOURT) (Data type : ATT Alphanumeric None ) (Options : ) ()
        When the user selects last editable cell with column header: "Normal title"
        Then the user adds the text <DESCRIPTION> in selected cell
        And the user hits tab

        # Field : Long title (Screen : ATB2 / INTITLONG) (Data type : ATT Alphanumeric None ) (Options : ) ()
        When the user selects last editable cell with column header: "Abbreviated title"
        Then the user adds the text <DESCSHORT> in selected cell

        # Field : Long title (Screen : ATB2 / INTITLONG) (Data type : ATT Alphanumeric None ) (Options : ) ()
        When the user selects last editable cell with column header: "Long title"
        Then the user adds the text <DESCLONG> in selected cell

        # Exit Table
        And the user hits tab

        # Button Save
        When the user clicks the "Save" main action button on the right panel
        And the user waits 1 seconds

        And the user clicks the "Validation" button in the header

        Given the user clicks "OK" button on the confirmation dialog


        Examples:
            | TBLNAME      | CODZONE   | CODTYP | LONG | DIME | DESCRIPTION      | DESCSHORT  | DESCLONG         |
            | "ITMSALES"   | "ZITSFLD" | "A"    | "5"  | "1"  | "Sales Field"    | "Sls Fld"  | "Sales Field"    |
            | "ITMFACILIT" | "ZITFFLD" | "A"    | "5"  | "1"  | "Site Field"     | "Site Fld" | "Site Field"     |
            | "BPCUSTOMER" | "ZBPCFLD" | "A"    | "5"  | "1"  | "Customer Field" | "Cust Fld" | "Customer Field" |
            | "BPSUPPLIER" | "ZBPSFLD" | "A"    | "5"  | "1"  | "Supplier Field" | "Sup Fld"  | "Supplier Field" |


    # #############################################################################
    Scenario: End Scenario Outline
    # #############################################################################



    # #############################################################################
    Scenario: Close page
        # #############################################################################

        Then the user clicks the Close page action icon on the header panel

    # #############################################################################
    Scenario: Disconnection
        # #############################################################################

        # Disconnection
        And the user logs-out from the system

