# ##############################################################################
# Script      : ATP_GESSOH_WOSOHALL
# Date        : 03/17/23 12:55:24
# Author      : Administrateur système (ADMIN)
# Comment     : Order management (Sales order)
# Version     : 2.9.05
# ##############################################################################

# #############################################################################
@SageX3AutomatedTestPlatform
Feature: FEATURE ATP_GESSOH_WOSOHALL
    # #############################################################################

    # #############################################################################
    Scenario: Connection
        # #############################################################################

        # Connection
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

        Given the user opens the "GESSOH" function

        # Transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed

    # #############################################################################
    Scenario Outline: Scenario Outline name: Creation Object Orders
        # #############################################################################

        # Button New
        When the user clicks the "New" main action button on the right panel
        And the user waits 1 seconds

        # Field : Sales site (Screen : SOH0 / SALFCY) (Data type : FCY Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Sales site"
        When the user writes <SOSITE> to the selected text field

        # Field : Type (Screen : SOH0 / SOHTYP) (Data type : TSO Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Type"
        When the user writes "SON" to the selected text field
        Then the value of the selected text field is "SON"

        # Field : Date (Screen : SOH0 / ORDDAT) (Data type : D Date None ) (Options : 1) (Date Format : Dz:MM[-]DD[-]YY) (!! Mandatory field !!)
        Given the user selects the date field with name: "Date"
        When the user writes today to the selected date field
        Then the user hits tab

        And the user selects the text field with name: "Date"

        #Stored value: store the value of the selected text field
        Given the user stores the value of the selected text field with the key: "ENV_Date"


        #Generate two dynamic sequences of 5 and 6 digits and store the values
        And the user stores the generated value with length 5 with the key "ENV_SEQ"


        # Field : Reference (Screen : SOH0 / CUSORDREF) (Data type : A Alphanumeric None ) (Options : ) ()
        Given the user selects the text field with name: "Reference"
        #Stored value: write in the selected text field the value previously stored
        #When the user writes the stored text with key "ENV_Date" in the selected text field
        And the user writes "[ENV_Date]-[ENV_SEQ]" to the selected text field


        # Field : Sold-to (Screen : SOH0 / BPCORD) (Data type : BPC Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Sold-to"
        When the user writes <SOCUST> to the selected text field

        # #############################################################################

        And the user clicks the "Delivery" tab selected by title

        # Field : Shipment site (Screen : WK2ALL2 / STOFCY) (Data type : FCY Alphanumeric None ) (Options : ) () (!! Mandatory field !!)
        Given the user selects the text field with name: "Shipment site  "
        When the user writes <SODLVSITE> to the selected text field

        # #############################################################################

        And the user clicks the "Lines" tab selected by title

        Then the user hits escape
        # Table : (Screen : WK2ALL4 / NBLIG) (Options : SKARID1)
        Given the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

        When the user selects last fixed cell with header: "Product"
        Then the user adds the text <LNITMREF> in selected cell

        When the user selects last editable cell with column header: "Ship site"
        Then the user adds the text <LNDSTOFCY> in selected cell

        When the user selects last editable cell with column header: "Ordered qty."
        Then the user adds the text <LNQTY> in selected cell
        And the user hits enter

        # Button Create
        When the user clicks the "Create" main action button on the right panel
        And the user waits 1 seconds

        Then a confirmation dialog appears with the message "Record has been created"

        Examples:
            | SOCUST   | SOREF  | SOSITE  | SODLVSITE | LNITMREF | LNDSTOFCY | LNQTY |
            | "NA010"  | "REF2" | "NA023" | "NA023"   | "FIN501" | "NA023"   | "1"   |
            | "NA010 " | "REF3" | "NA023" | "NA023"   | "FIN501" | "NA023"   | "2"   |

    # #############################################################################
    Scenario Outline: End Scenario Outline: Creation Object Orders
    # #############################################################################


    # #############################################################################
    Scenario: Close page Order management (Sales order ALL : Full entry)
        # #############################################################################

        Then the user clicks the Close page action icon on the header panel

    # #############################################################################
    Scenario: Disconnection
        # #############################################################################

        # Disconnection
        And the user logs-out from the system


