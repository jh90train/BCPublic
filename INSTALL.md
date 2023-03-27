# Bootcamp ATP - Install

## Install ATP client

### Links

- [Sage X3 technical help](https://online-help.sageerpx3.com/erp/12/public/index.html)
- [Sage X3 Automated Test Platform - User guide](https://online-help.sageerpx3.com/erp/12/wp-static-content/public/ATP%20User%20Guide/Content/How-to%20guides/Platform/ATP_UserGuide/T1_ATP_UserGuide.htm)
- [Sage City](https://www.sagecity.com/us/)

## Run Prerequisites sample

### Update file parameters-cloud-chrome

```powershell
# Change RELATIVE_EXEC_PATH
# Before
RELATIVE_EXEC_PATH=/Samples/03-Samples/*.feature
# After
RELATIVE_EXEC_PATH=/Samples/01-Prerequisites/*.feature
```

```powershell
# Change userStoredValuesFile
# Before
userStoredValuesFile=cucumber-user-config/user/user-stored-values
# After
userStoredValuesFile=cucumber-user-config/samples/samples-user-stored-values
```

### Run cloud-chrome

```powershell
PS > npm run cloud-chrome


```
