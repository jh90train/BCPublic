# ##############################################################################
# Script      : ATP_GESSOH_WOSOHALL
# Date        : 03/17/23 12:55:24
# Author      : Administrateur système (ADMIN)
# Comment     : Order management (Sales order)
# Version     : 2.9.05
# ##############################################################################

# #############################################################################
@SageX3AutomatedTestPlatform
#COEX | param:USV_SOSITE | param:USV_SOCUST | param:USV_SODLVSITE   |
#COEX | "NA023"   | "NA010"    | "NA023"         |
#COEX | "NA023"   | "NA010"    | "NA023"         |


Feature: X3-SOEntry-olivier-2.event
    # #############################################################################

    # #############################################################################
    Scenario: Event Begin

    Examples:

    | param:USV_SOSITE  | param:USV_SOCUST  | param:USV_SODLVSITE   |
    | "NA023"           | "NA010"           | "NA023"               |
    | "NA023"           | "NA010"           | "NA023"               |
        