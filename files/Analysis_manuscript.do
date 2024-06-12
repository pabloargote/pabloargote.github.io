

use "polls_replication", clear

* Table 4

reg share_foreign_census foreign_1992
outreg2 using iv_attitudes4, tex(fragment)  ctitle("First Stage") dec(4)  keep(foreign_1992) ///
nocons addstat(F-test, e(F), e(r2), e(N)) nor2 noobs nonotes label replace 

ivreg2 immigrants_deport (share_foreign_census  = foreign_1992 ) foreign_2002  i.education2 female i.poll i.income edad i.region3 log_pop,  cl(region3) first
outreg2 using iv_attitudes4, append tex(fragment)  ctitle("Deport") dec(4)  keep(share_foreign_census) ///
nocons addstat(F-test, e(F), e(r2), e(N)) nor2 noobs nonotes label 

ivreg2 immigrants_excessive (share_foreign_census   = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region3 log_pop,   cl(region3)
outreg2 using iv_attitudes4, append tex(fragment)  ctitle("Excessive") dec(4)  keep(share_foreign_census) ///
nocons addstat(F-test, e(F), e(r2), e(N)) nor2 noobs   nonotes label

ivreg2 immigrants_health (share_foreign_census  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region3 log_pop,  cl(region3)
outreg2 using iv_attitudes4,  append tex(fragment)  ctitle("Public") dec(4)  keep(share_foreign_census) ///
nocons addstat(F-test, e(F), e(r2), e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_econ (share_foreign_census  = foreign_1992 ) foreign_2002 female i.poll i.income edad i.region3 log_pop,  cl(region3)
outreg2 using iv_attitudes4, append tex(fragment)  ctitle("Econ.") dec(4)  keep(share_foreign_census) ///
nocons addstat(F-test, e(F), e(r2), e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_work (share_foreign_census  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region3 log_pop,  cl(region3)
outreg2 using iv_attitudes4, append tex(fragment)  ctitle("Work") dec(4)  keep(share_foreign_census) ///
nocons addstat(F-test, e(F), e(r2), e(N)) nor2 noobs  nonotes  label


* p75

reg exposure_p75 foreign_1992    i.region3 
outreg2 using iv_attitudes, tex(fragment)  ctitle("First Stage") dec(2)  keep(foreign_1992) ///
nocons addstat(F-test, e(F), e(r2), Obs., e(N)) nor2 noobs nonotes label replace 

ivreg2 immigrants_deport (exposure_p75  = foreign_1992  )  foreign_2002  i.education2 female i.poll i.income edad i.region log_pop,  cl(region) 
outreg2 using iv_attitudes, append tex(fragment) ctitle("Deport") dec(2)  keep(exposure_p75) ///
nocons addstat(F-test, e(F), e(r2), Obs., e(N)) nor2 noobs nonotes label 

ivreg2 immigrants_excessive (exposure_p75  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop ,  cl(region)
outreg2 using iv_attitudes, append tex(fragment)  ctitle("Excessive") dec(2)  keep(exposure_p75) ///
nocons addstat(F-test, e(F), e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_health (exposure_p75  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop ,  cl(region)
outreg2 using iv_attitudes, append tex(fragment)  ctitle("Public") dec(2)  keep(exposure_p75) ///
nocons addstat(F-test, e(F), e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_econ (exposure_p75  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop ,  cl(region)
outreg2 using iv_attitudes, append tex(fragment)  ctitle("Econ.") dec(2)  keep(exposure_p75) ///
nocons addstat(F-test, e(F), e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_work (exposure_p75  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop ,  cl(region)
outreg2 using iv_attitudes, append tex(fragment)  ctitle("Work") dec(2)  keep(exposure_p75) ///
nocons addstat(F-test, e(F), e(r2), Obs., e(N)) nor2 noobs  nonotes label

* P50

reg exposure_p50 foreign_1992  i.region3 
outreg2 using iv_attitudes3, tex(fragment)  ctitle("First Stage") dec(2)  keep(foreign_1992) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes label replace 

ivreg2 immigrants_deport (exposure_p50  = foreign_1992 foreign_2002)   i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes3, tex(fragment)  ctitle("Deport") dec(2)  keep(exposure_p50) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes label append

ivreg2 immigrants_excessive (exposure_p50  = foreign_1992 foreign_2002)  i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes3, append tex(fragment)  ctitle("Excessive") dec(2)  keep(exposure_p50) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs   nonotes label

ivreg2 immigrants_health (exposure_p50  = foreign_1992 foreign_2002)  i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes3,  append tex(fragment)  ctitle("Public") dec(2)  keep(exposure_p50) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes  label

ivreg2 immigrants_econ (exposure_p50  = foreign_1992 foreign_2002)  female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes3, append tex(fragment)  ctitle("Econ.") dec(2)  keep(exposure_p50) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_work (exposure_p50  = foreign_1992 foreign_2002)  i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes3, append tex(fragment)  ctitle("Work") dec(2)  keep(exposure_p50) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

* Table 5

reg immigrants_deport share_haiti share_ven foreign_2002  i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_hai,  tex(fragment)   ctitle("Deport") dec(4)  keep(share_haiti share_ven) ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label replace

reg immigrants_excessive share_haiti share_ven foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_hai,  tex(fragment)   ctitle("Excessive") dec(4)  keep(share_haiti share_ven) ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs nonotes label  append

reg immigrants_health share_haiti share_ven foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_hai,  tex(fragment)   ctitle("Public") dec(4)  keep(share_haiti share_ven) ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs nonotes label  append

reg immigrants_econ share_haiti share_ven foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_hai,  tex(fragment)   ctitle("Econ.") dec(4)  keep(share_haiti share_ven) ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs nonotes label  append

reg immigrants_work share_haiti share_ven foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_hai,  tex(fragment)   ctitle("Work") dec(4)  keep(share_haiti share_ven) ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label append

reg immigrants_deport share_haiti share_ven foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_hai,  tex(fragment)   ctitle("Deport") dec(4)  keep(share_haiti share_ven) ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs nonotes label  append

* Table 6

reg immigrants_deport  c.share_foreign_census##ib4.education2 foreign_2002 female i.poll i.income edad i.region3, vce(cluster region3)
outreg2 using skill_level, replace tex(fragment)  ctitle("Deport.") keep(c.share_foreign_census##ib4.education2) dec(4) ///
nocons nor2 noobs  nonotes label

reg immigrants_excessive  c.share_foreign_census##ib4.education2 foreign_2002 female i.poll i.income edad i.region3, cl(region3)
outreg2 using skill_level, append tex(fragment)  ctitle("Excessive.") keep( c.share_foreign_census##ib4.education2 ) dec(4)   ///
nocons nor2 noobs  nonotes  label

reg immigrants_health   c.share_foreign_census##ib4.education2 foreign_2002 female i.poll i.income edad i.region3, vce(cluster region3) 
outreg2 using skill_level, append tex(fragment)  ctitle("Public") keep(c.share_foreign_census##ib4.education2 ) dec(4)   ///
nocons  nor2 noobs  nonotes  label

reg immigrants_econ  c.share_foreign_census##ib4.education2 foreign_2002 female i.poll i.income edad i.region3, vce(cluster region3)
outreg2 using skill_level, append tex(fragment)  ctitle("Econ.") keep( c.share_foreign_census##ib4.education2 ) dec(4)   ///
nocons  nor2 noobs  nonotes  label

reg immigrants_work  c.share_foreign_census##ib4.education2 foreign_2002 female i.poll i.income edad i.region3, vce(cluster region3)
outreg2 using skill_level, append tex(fragment)  ctitle("Work") keep( c.share_foreign_census##ib4.education2 ) dec(4)   ///
nocons nor2 noobs  nonotes  label

* Table 8

ivprobit immigrants_health (share_foreign_census  = foreign_1992)  foreign_2002 female i.poll i.income edad i.region3 log_pop, vce(cluster region3)
outreg2 using iv_probit, tex(fragment)  ctitle("Public") dec(4)  keep(share_foreign_census) ///
nocons nor2 noobs nonotes label replace 

ivprobit immigrants_deport (share_foreign_census  = foreign_1992 ) foreign_2002  i.education2 female i.poll i.income edad i.region3 log_pop,  vce(cluster region3)
outreg2 using iv_probit, append tex(fragment)  ctitle("Deport") dec(4)  keep(share_foreign_census) ///
nocons  nor2 noobs nonotes label 

ivprobit immigrants_excessive (share_foreign_census   = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region3 log_pop,  vce(cluster region3)
outreg2 using iv_probit, append tex(fragment)  ctitle("Excessive") dec(4)  keep(share_foreign_census) ///
nocons  nor2 noobs   nonotes label

ivprobit immigrants_econ (share_foreign_census  = foreign_1992)  foreign_2002 female i.poll i.income edad i.region3 log_pop, vce(cluster region3)
outreg2 using iv_probit, tex(fragment)  ctitle("Econ") dec(4)  keep(share_foreign_census) ///
nocons  nor2 noobs nonotes label append 

ivprobit immigrants_work (share_foreign_census  = foreign_1992)  foreign_2002 female i.poll i.income edad i.region3 log_pop, vce(cluster region3)
outreg2 using iv_probit, tex(fragment)  ctitle("Work") dec(4)  keep(share_foreign_census) ///
nocons nor2 noobs nonotes label append 

* p75

ivprobit immigrants_health (exposure_p75  = foreign_1992)  foreign_2002 female i.poll i.income edad i.region3 log_pop, vce(cluster region3)
outreg2 using iv_probit2, tex(fragment)  ctitle("Public") dec(4)  keep(exposure_p75) ///
 nor2 noobs  label  replace 

ivprobit immigrants_deport (exposure_p75  = foreign_1992 ) foreign_2002  i.education2 female i.poll i.income edad i.region3 log_pop,  vce(cluster region3)
outreg2 using iv_probit2, append tex(fragment)  ctitle("Deport") dec(4)  keep(exposure_p75) ///
nocons nor2 noobs nonotes label 

ivprobit immigrants_excessive (exposure_p75   = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region3 log_pop,   vce(cluster region3)
outreg2 using iv_probit2, append tex(fragment)  ctitle("Excessive") dec(4)  keep(exposure_p75) ///
nocons  nor2 noobs   nonotes label
 
ivprobit immigrants_econ (exposure_p75  = foreign_1992)  foreign_2002 female i.poll i.income edad i.region3 log_pop, vce(cluster region3)
outreg2 using iv_probit2,  append tex(fragment)  ctitle("Econ") dec(4)  keep(exposure_p75) ///
nocons  nor2 noobs  label 

ivprobit immigrants_work (exposure_p75  = foreign_1992)  foreign_2002 female i.poll i.income edad i.region3 log_pop, vce(cluster region3)
outreg2 using iv_probit2, append tex(fragment)  ctitle("Work") dec(4)  keep(exposure_p75) ///
nocons nor2 noobs  label 

* p50

ivprobit immigrants_health (exposure_p50  = foreign_1992)  foreign_2002 female i.poll i.income edad i.region3 log_pop, vce(cluster region3)
outreg2 using iv_probit3, tex(fragment)  ctitle("Public") dec(4)  keep(exposure_p50) ///
nocons nor2 noobs nonotes label replace 

ivprobit immigrants_deport (exposure_p50  = foreign_1992 ) foreign_2002  i.education2 female i.poll i.income edad i.region3 log_pop,  vce(cluster region3)
outreg2 using iv_probit3, append tex(fragment)  ctitle("Deport") dec(4)  keep(exposure_p50) ///
nocons  nor2 noobs nonotes label 

ivprobit immigrants_excessive (exposure_p50   = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region3 log_pop,  vce(cluster region3)
outreg2 using iv_probit3, append tex(fragment)  ctitle("Excessive") dec(4)  keep(exposure_p50) ///
nocons  nor2 noobs   nonotes label

ivprobit immigrants_econ (exposure_p50  = foreign_1992)  foreign_2002 female i.poll i.income edad i.region3 log_pop, vce(cluster region3)
outreg2 using iv_probit3,  append tex(fragment)  ctitle("Econ") dec(4)  keep(exposure_p50) ///
nocons nor2 noobs  label 

ivprobit immigrants_work (exposure_p50  = foreign_1992)  foreign_2002 female i.poll i.income edad i.region3 log_pop, vce(cluster region3)
outreg2 using iv_probit3, append tex(fragment)  ctitle("Work") dec(4)  keep(exposure_p50) ///
nocons nor2 noobs  label 

* Table 9

reg share_foreign_census foreign_1992 
outreg2 using iv_attitudes4_or, tex(fragment)  ctitle("First Stage") dec(4)  keep(foreign_1992) ///
nocons addstat(F-test, e(F), e(r2), e(N)) nor2 noobs nonotes label replace 

ivreg2 immigrants_health2 (share_foreign_census  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region3 log_pop,  cl(region3)
outreg2 using iv_attitudes4_or,  append tex(fragment)  ctitle("Public") dec(4)  keep(share_foreign_census) ///
nocons addstat(F-test, e(F), e(r2), e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_econ2 (share_foreign_census  = foreign_1992 ) foreign_2002 female i.poll i.income edad i.region3 log_pop,  cl(region3)
outreg2 using iv_attitudes4_or, append tex(fragment)  ctitle("Econ.") dec(4)  keep(share_foreign_census) ///
nocons addstat(F-test, e(F), e(r2), e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_work2 (share_foreign_census  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region3 log_pop,  cl(region3)
outreg2 using iv_attitudes4_or, append tex(fragment)  ctitle("Work") dec(4)  keep(share_foreign_census) ///
nocons addstat(F-test, e(F), e(r2), e(N)) nor2 noobs  nonotes  label

* Table 10

reg share_ven foreign_1992  i.region3 
outreg2 using iv_attitudes_ven,  tex(fragment)  ctitle("First Stage") dec(4)  keep(foreign_1992) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes label replace

ivreg2 immigrants_deport (share_ven  = foreign_1992 )  foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven,  tex(fragment)  ctitle("Deport") dec(4)  keep(share_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes  append label

ivreg2 immigrants_excessive (share_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven, append tex(fragment)  ctitle("Excessive") dec(4)  keep(share_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_health (share_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven, append tex(fragment)  ctitle("Public") dec(4)  keep(share_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_econ (share_ven  = foreign_1992 ) foreign_2002 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven, append tex(fragment)  ctitle("Econ.") dec(4)  keep(share_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_work (share_ven  = foreign_1992 ) foreign_2002  i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven, append tex(fragment)  ctitle("Work") dec(4)  keep(share_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

* p75

reg exposure_p75_ven foreign_1992  i.region3 
outreg2 using iv_attitudes_ven2,  tex(fragment)  ctitle("First Stage") dec(2)  keep(foreign_1992) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes  replace label

ivreg2 immigrants_deport (exposure_p75_ven  = foreign_1992 )  foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven2,  tex(fragment)  ctitle("Deport") dec(2)  keep(exposure_p75_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes  append label

ivreg2 immigrants_excessive (exposure_p75_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven2, append tex(fragment)  ctitle("Excessive") dec(2)  keep(exposure_p75_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_health (exposure_p75_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven2, append tex(fragment)  ctitle("Public") dec(2)  keep(exposure_p75_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_econ (exposure_p75_ven  = foreign_1992 ) foreign_2002 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven2, append tex(fragment)  ctitle("Econ.") dec(2)  keep(exposure_p75_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_work (exposure_p75_ven  = foreign_1992 ) foreign_2002  i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven2, append tex(fragment)  ctitle("Work") dec(2)  keep(exposure_p75_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label


* P50

reg exposure_p50_ven foreign_1992  i.region3 
outreg2 using iv_attitudes_ven3,  tex(fragment)  ctitle("First Stage") dec(2)  keep(foreign_1992) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes label replace

ivreg2 immigrants_deport (exposure_p50_ven  = foreign_1992 )  foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven3,  tex(fragment)  ctitle("Deport") dec(2)  keep(exposure_p50_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes  append

ivreg2 immigrants_excessive (exposure_p50_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven3, append tex(fragment)  ctitle("Excessive") dec(2)  keep(exposure_p50_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_health (exposure_p50_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven3, append tex(fragment)  ctitle("Public") dec(2)  keep(exposure_p50_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_econ (exposure_p50_ven  = foreign_1992 ) foreign_2002 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven3, append tex(fragment)  ctitle("Econ.") dec(2)  keep(exposure_p50_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_work (exposure_p50_ven  = foreign_1992 ) foreign_2002  i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven3, append tex(fragment)  ctitle("Work") dec(2)  keep(exposure_p50_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label


  
  
* Table 10

reg share_ven foreign_1992  
outreg2 using iv_attitudes_ven,  tex(fragment)  ctitle("First Stage") dec(4)  keep(foreign_1992) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes label replace

ivreg2 immigrants_deport (share_ven  = foreign_1992 )  foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven,  tex(fragment)  ctitle("Deport") dec(4)  keep(share_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes  append label

ivreg2 immigrants_excessive (share_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven, append tex(fragment)  ctitle("Excessive") dec(4)  keep(share_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_health (share_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven, append tex(fragment)  ctitle("Public") dec(4)  keep(share_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_econ (share_ven  = foreign_1992 ) foreign_2002 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven, append tex(fragment)  ctitle("Econ.") dec(4)  keep(share_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_work (share_ven  = foreign_1992 ) foreign_2002  i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven, append tex(fragment)  ctitle("Work") dec(4)  keep(share_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

* p75

reg exposure_p75_ven foreign_1992  i.region3 
outreg2 using iv_attitudes_ven2,  tex(fragment)  ctitle("First Stage") dec(2)  keep(foreign_1992) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes  replace label

ivreg2 immigrants_deport (exposure_p75_ven  = foreign_1992 )  foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven2,  tex(fragment)  ctitle("Deport") dec(2)  keep(exposure_p75_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes  append label

ivreg2 immigrants_excessive (exposure_p75_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven2, append tex(fragment)  ctitle("Excessive") dec(2)  keep(exposure_p75_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_health (exposure_p75_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven2, append tex(fragment)  ctitle("Public") dec(2)  keep(exposure_p75_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_econ (exposure_p75_ven  = foreign_1992 ) foreign_2002 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven2, append tex(fragment)  ctitle("Econ.") dec(2)  keep(exposure_p75_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_work (exposure_p75_ven  = foreign_1992 ) foreign_2002  i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven2, append tex(fragment)  ctitle("Work") dec(2)  keep(exposure_p75_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label


* P50

reg exposure_p50_ven foreign_1992  i.region3 
outreg2 using iv_attitudes_ven3,  tex(fragment)  ctitle("First Stage") dec(2)  keep(foreign_1992) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes label replace

ivreg2 immigrants_deport (exposure_p50_ven  = foreign_1992 )  foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven3,  tex(fragment)  ctitle("Deport") dec(2)  keep(exposure_p50_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs nonotes  append

ivreg2 immigrants_excessive (exposure_p50_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven3, append tex(fragment)  ctitle("Excessive") dec(2)  keep(exposure_p50_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_health (exposure_p50_ven  = foreign_1992 ) foreign_2002 i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven3, append tex(fragment)  ctitle("Public") dec(2)  keep(exposure_p50_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_econ (exposure_p50_ven  = foreign_1992 ) foreign_2002 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven3, append tex(fragment)  ctitle("Econ.") dec(2)  keep(exposure_p50_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

ivreg2 immigrants_work (exposure_p50_ven  = foreign_1992 ) foreign_2002  i.education2 female i.poll i.income edad i.region log_pop,  cl(region)
outreg2 using iv_attitudes_ven3, append tex(fragment)  ctitle("Work") dec(2)  keep(exposure_p50_ven) ///
nocons addstat(F-test, e(F), R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label


use "elections_immigration", clear

* Table 7


reghdfe ed_share share_foreign, absorb(comuna_string  year) vce(cluster region)
outreg2 using pg, replace   tex(fragment)  ctitle("Ed. share") keep(share_foreign  ) dec(2)  ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label
  
reghdfe ed_share share_foreign log_pop log_income edad zona_1, absorb(comuna_string  year) vce(cluster region)
outreg2 using pg, append  tex(fragment)  ctitle("Health share") keep(share_foreign  ) dec(2)  ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label  
  
reghdfe health_share share_foreign, absorb(comuna_string  year) vce(cluster region)
outreg2 using pg, append tex(fragment)   ctitle("Health share") keep(share_foreign  ) dec(2)  ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

reghdfe health_share share_foreign log_pop log_income edad zona_1, absorb(comuna_string  year) vce(cluster region)
outreg2 using pg, append tex(fragment)   ctitle("Health share") keep(share_foreign  ) dec(2)  ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label


reghdfe ed_share  F2.share_foreign  log_pop log_income edad zona_1, absorb(comuna_string  year) vce(cluster region)
outreg2 using pg_leads, replace tex(fragment)  ctitle("Ed. share") keep(F2.share_foreign) dec(2)  ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs   nonotes label

reghdfe ed_share F2.share_foreign  log_pop log_income edad zona_1, absorb(comuna_string  year) vce(cluster region)
outreg2 using pg_leads, append tex(fragment)  ctitle("Health share") keep(F2.share_foreign  ) dec(2)  ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs    nonotes label
   
reghdfe health_share F2.share_foreign , absorb(comuna_string  year) vce(cluster region)
outreg2 using pg_leads, append tex(fragment)  ctitle("Health share") keep(F2.share_foreign ) dec(2) ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

reghdfe health_share F2.share_foreign   log_pop log_income edad zona_1, absorb(comuna_string  year) vce(cluster region)
outreg2 using pg_leads, append tex(fragment)  ctitle("Health share") keep(F2.share_foreign  ) dec(2)  ///
nocons addstat(R^2, e(r2), Obs., e(N)) nor2 noobs  nonotes label

