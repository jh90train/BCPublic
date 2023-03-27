###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code :  10-10-purchase-order
# - Description :
#       Purchases order creation
#           1) Enter Header
#           2) Enter Lines
#           3) Verifications lines
#           4) Cick button Create
#           5) Verification signature
#
# - Created date : 2022-05-10
# - Updated date : 2022-05-10
###########################################################################

@SageX3AutomatedTestPlatform
Feature: 10-10-purchase-order

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

    #And the user waits 60 seconds
    Scenario Outline: Purchases order creation - Verification values in lines
        # Verifications values
        #And the user selects the data table of section: "Lignes"
        And the user selects editable table row number: 1
        #When the user selects cell with column header: "Produit" and row number: 1
        And the user selects cell with header: "Produit" of selected row
        Then the value of the selected cell is <CCE3>
        And the user selects cell with header: "CQ" of selected row
        Then the value of the selected cell is <QC>

        Examples:
            | CCE3  | QC    |
            | "880" | "Oui" |

    Scenario: Purchases order creation - Button create
        #Create the purchases order
        When the user clicks the "Créer" main action button on the right panel
        Then a confirmation dialog appears with the message "Fiche créée"

        #Save the purchase order reference in a stored value
        And the user selects the text field with name: "Commande standard"
        Then the user stores the value of the selected text field with the key: "ENV_OrderNum"


    Scenario Outline: Purchases order creation - Verification Signature circuit

        #Right panel action: open the header drop down
        Given the user opens the header drop down

        #Right panel action: open the required section of the header dropdown
        When the user opens the "Signature" section on the right panel

        #Right panel action: click the required action of the header drop down
        Then the user clicks the "Circuit de signature" action button on the header drop down
        #And the user waits 10 seconds

        #Modal Dialog: check the required modal dialog is opened
        Then the modal dialog "Circuit de signature" is displayed

        When the user selects the main data table of the page
        When the user selects the data table in the popup
        Then the user selects search cell with header: "Destinataire"
        And the user adds the text <signatureUser> in selected cell and hits tab key
        Then the user selects search cell with header: "Flag signature"
        And the user adds the text <signatureFlag> in selected cell and hits tab key
        And the user clicks on the selected cell

        And the user clicks the Close page action icon on the header panel

        Examples:
            | signatureUser | signatureFlag |
            | "FU06"        | "A signer"    |

    Scenario: Close main function and logout scenario
        #Close the function
        Then the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system

