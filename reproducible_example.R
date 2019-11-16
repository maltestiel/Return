library(xts)
# what to do: 
# w_m1 * return_m2
load("Data.rda")

# You can easily do this /w the full matrix
# I just chopped it to make the 
# Mickey-Mouse-Case more handy / readable. 
returns <- tail(one_M_Return[,1:2])
weights <- tail(weights_3_6[,1:2])

# turn the data into a true time series format 
# in order for the lag functions to work
# make sure you understand how k works, i.e., 
# in which directions k = 1, k = -1 move the data. 
# also make sure to use lag from stats, because there
# are other functions called lag too and they might handle
# k differently in the sense that k_o = k*(-1)
# general advice I: read R Code from the inside out
# general advice II: if you're using a loop on a 2-D structure
# such as a matrix or data.frame you're likely doing something
# wrong. 
weights * as.data.frame(stats::lag(as.xts(returns),-1))

