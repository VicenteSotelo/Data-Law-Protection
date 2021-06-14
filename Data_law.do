

*Author: Vicente Sotelo
*Goal  : Regresions between Data Law Protection and political-institutional covariates



*Setting directory
pwd

cd "~/Downloads"

*Importing data 

import excel using Data_Protection_Final.xlsx, describe

import excel using Data_Protection_Final.xlsx, sheet(Sheet1) firstrow


*Processing data 
global string_var WB_CC WB_GE WB_RQ WB_ROL WB_VA

foreach x in $string_var {

generate n_`x' = real(`x')
}


g d_DATA_LAW= 1 if(DATA_LAW==3 | DATA_LAW==4) & (DATA_LAW<99)	

replace d_DATA_LAW= 0 if(DATA_LAW==1 | DATA_LAW==2) & (DATA_LAW<99)	


*Outputs 

global x_var n_* WB_PS PBIPCPPP FH_PR FH_CL TELECOM TRADE LAC AFRICASUB NAME UE NAMER OCEANIA SASIA SEASIA EASTEURO

pwcorr DATA_LAW $x_var, star(0.05)




