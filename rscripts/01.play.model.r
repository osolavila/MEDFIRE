rm(list=ls())
setwd("c:/work/MEDMOD/SpatialModelsR/MEDFIRE")  #Nú HP
# setwd("d:/MEDMOD/SpatialModelsR/MEDFIRE")   #CTFC

# set the scenario
source("mdl/define.scenario.r")
scn.name <- "Test"
define.scenario(scn.name)
# run the model
source("mdl/land.dyn.mdl.r")  
system.time(land.dyn.mdl(scn.name))


## Create .Rdata with static variables of the model, only run once for all scenarios!
source("mdl/read.static.vars.r")
read.static.vars()
## Create .Rdata with initial values of variables of the model, used at each replicate of any scn.
source("mdl/read.state.vars.r")
read.state.vars()
## Create 2 data frames per climatic scn and decade: SDMs of all spp, and climatic variables (temp & precip) for CAT
source("mdl/read.climatic.vars.r")
read.climatic.vars()
## Save interfaces
source("mdl/update.interface.r")
load("inputlyrs/rdata/land.rdata")
interface <- update.interface(land)
save(interface, file="inputlyrs/rdata/interface.rdata")