###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code :  10-20-purchase-receipt
# - Description :
#       1) Purchases order creation
#           a) Enter Header
#           b) Enter Lines
#           c) Cick button Create

#       2) Purchase order approbation

#       3) Create receipt with purchase order picking
#           a) Enter header
#           b) Update lines
#           c) Verification lines
#           d) Cick button create
#       4) Delete receipt

#
#
# - Created date : 2022-05-10
# - Updated date : 2022-05-10
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 10-20-purchase-receipt

    Scenario: Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        #Given the user is logged into Sage X3 with "param:loginType" using user name "USR01" and password "USR01"
        And the user changes the main language code to "fr-FR"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: Purchases order creation - Header

        #Open purchase order function
        Given the user opens the "GESPOH" function

        #Select purchase order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Tout saisi" and column header: ""
        And the user clicks on the selected cell

        Then the "Commande d'achat ALL : Tout saisi" screen is displayed

        #Entering in creation mode
        When the user clicks the "Nouveau" main action button on the right panel

        #Set header information
        Then the user selects the text field with name: "Site commande"
        And the user writes "[USV_OrderSite]" to the selected text field
        And the user selects the text field with name: "Fournisseur"
        And the user writes "[USV_OrderSupplier]" to the selected text field

    Scenario Outline: Purchases order creation - Lines
        Then the user clicks the "Lignes" tab selected by title

        #Set purchases order lines information
        Then the user selects the fixed data table of section: "Lignes"
        And the user selects last fixed cell with header: "Article"
        And the user adds the text <product> in selected cell
        And the user selects the data table of section: "Lignes"
        And the user selects last editable cell with column header: "Site rcp"

        And the user adds the text "[USV_SiteRcp]" in selected cell
        And the user selects last editable cell with column header: "Qté commandée"
        And the user adds the text <orderedQty> in selected cell
        And the user hits enter

        Examples:
            | product | orderedQty |
            | "L500"  | "400"      |

    Scenario: Purchases order creation - Button create
        #Create the purchases order
        When the user clicks the "Créer" main action button on the right panel
        Then a confirmation dialog appears with the message "Fiche créée"

        #Save the purchase order reference in a stored value
        And the user selects the text field with name: "Commande standard"
        Then the user stores the value of the selected text field with the key: "ENV_OrderNum"

    Scenario: Purchases order approbation

        #Close the function
        Then the user clicks the Close page action icon on the header panel

        #Open Workflow monitor function
        Given the user opens the "SAIWRKPLN" function

        #Select purchase signatures transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "Signatures achats" and column header: "Title"
        And the user clicks on the selected cell

        Then the "Signatures achats (PUR)" screen is displayed

        And the user selects the date field with name: "Date début"
        And the user writes a generated date in the selected date field using the value "T-2"
        And the user selects the date field with name: "Date fin"
        And the user writes a generated date in the selected date field using the value "T+2"

        And the user clicks the "Recherche" button in the header

        #Sign the Purchase order information
        When the user clicks the "Sig Cde" tab selected by title
        #And the user selects the fixed data table for x3 field name: "WMIPUR3_ARRAY_NBLIG"
        And the user selects the fixed data table of section: "Sig Cde"
        #Approve the purchase order previously created thanks to reference saved in the stored value
        And the user selects row that has stored text with the key: "ENV_OrderNum" in column with header: "N° Commande"
        And the user opens "Signature" function on toolbox of the selected row
        And the modal dialog "Choix d'une réponse" is displayed
        When the user selects the data table in the popup
        And the user selects cell with text: "VAL Validation" and column header: ""
        And the user clicks on the selected cell

        #Close the function
        Then the user clicks the Close page action icon on the header panel

    Scenario: Create receipt with purchase order picking - Header

        #Open purchases receipts function
        Given the user opens the "GESPTH" function

        #Select receipt transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Tout saisi" and column header: ""
        And the user clicks on the selected cell

        Then the "Réceptions d'achat ALL : Tout saisi" screen is displayed

        #Enter in creation mode and define header values
        When the user clicks the "Nouveau" main action button on the right panel

        #Set header information
        Then the user selects the text field with name: "Site réception"
        And the user writes "[USV_Sitercp]" to the selected text field
        And the user selects the text field with name: "Fournisseur"
        And the user writes "[USV_OrderSupplier]" to the selected text field and hits tab key

        When  the user selects the text field with name: "Date réception"
        Then the user stores the value of the selected text field with the key: "ENV_Date"
        And  the user stores the generated value with length 5 with the key "ENV_Number"
        And the user selects the text field with name: "BL fournisseur"
        And the user writes "BL-[ENV_Date]-[ENV_Number]" to the selected text field and hits tab key
        #Left panel: open the picking list and select the required order
        Given the user clicks the "Sélection commandes" link on the left panel
        When the user selects the main picking list panel of the screen
        #Then the user clicks on the Expand all option of the picking list toolbar
        And the user selects the item with the stored text with key "ENV_OrderNum" and with the text containing "" of the picking list panel


        # And the user expands the selected picking list panel item
        # And the user selects the item "BMS001 _ Ord Qty 4 UN To be received 4" of the picking list panel next level
        And the user checks the selected picking list panel item

    Scenario Outline: Create receipt with purchase order picking - Update lines
        Given the user selects the data table of section: "Lignes"
        #And the user selects row
        #When the user selects cell with column header: "Produit" and row number: 1
        Then the user selects row by multiple criteria that has the text <line> in column with header: "Ligne" and the text <product> in column with header: "Article"
        And the user selects cell with header: "Lot fournisseur" of selected row
        Then the user adds the text <supplierLot> in selected cell
        #And the user hits tab key in the selected cell
        And the user hits enter
        #And the user hits enter key in the selected cell
        #And the user selects cell with header: "CQ" of selected row
        #Then the value of the selected cell is <QUAFLG>

        Then the modal dialog "Saisie complément lot" is displayed
        And the user clicks the "OK" button in the header
        Examples:
            | line   | product | supplierLot |
            | "1000" | "L500"  | "LOT10"     |

    Scenario Outline: Create receipt with purchase order picking - Verification lines
        Given the user selects the data table of section: "Lignes"
        #And the user selects row
        #When the user selects cell with column header: "Produit" and row number: 1
        Then the user selects row by multiple criteria that has the text <line> in column with header: "Ligne" and the text <product> in column with header: "Article"
        And the user selects cell with header: "Soumis CQ" of selected row
        Then the value of the selected cell is <submittedQC>
        And the user selects cell with header: "Statut" of selected row
        Then the value of the selected cell has string pattern <status>
        #And the user hits tab key in the selected cell
        #And the user hits enter
        #And the user hits enter key in the selected cell
        #And the user selects cell with header: "CQ" of selected row
        #Then the value of the selected cell is <QUAFLG>

        #Then the modal dialog "Saisie complément lot" is displayed
        #And the user clicks the "OK" button in the header
        Examples:
            | line   | product | supplierLot | submittedQC               | status |
            | "1000" | "L500"  | "LOT10"     | "Contrôle non modifiable" | "Q*"   |

    Scenario: Create receipt with purchase order picking - Button Create
        #Create the purchases order
        When the user clicks the "Créer" main action button on the right panel
        Then a confirmation dialog appears with the message "Fiche créée"

    Scenario: Delete receipt

        Then the user clicks the "Supprimer" main action button on the right panel
        #Confirmation dialog: click on the OK action
        Given the user clicks "OK" button on the confirmation dialog
        #Alert box: verification of the message displayed

        Then an alert box appears


        #Alert box: confirmation by clicking on the ok action

        And the user clicks the "OK" opinion in the alert box
    #And the user waits 10 seconds
    #Close the function
    #Then the user clicks the Close page action icon on the header panel

    Scenario: Close main function and logout scenario
        #Close the function
        Then the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system

