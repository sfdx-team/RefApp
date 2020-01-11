<h1> Basic Ref App </>
## Dev, Build and Test

## Resources

## Description of Files and Directories

## Issues
## For New Orgs
Push the app to your scratch org:
1) sfdx force:source:push
##Assign the referee permission set to the default user:
3) sfdx force:user:permset:assign -n referee

Load sample data: this needs work
4) sfdx force:data:tree:import --plan ./data/data-plan.json

5)sfdx force:permset:assign -n referee



