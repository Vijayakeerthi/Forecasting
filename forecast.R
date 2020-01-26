library(pracma)
library(forecast)

x=as.numeric(c(1,4,5,6,10,12,15))

s<-movavg(x, 3, type=c("s"))

e<-movavg(x, 3, type=c("e"))

w<-movavg(x, 3, type=c("w"))


df <- read.csv(file.choose())
unempl <- ts(df, start = c(2012, 1), frequency = 12)
plot(unempl)

fit_ets_default <- ets(unempl)
fcast_ets_default <- forecast(fit_ets_default, h = 12)
plot(fcast_ets_default)


a<-auto.arima(unempl,d = 1,stationary = TRUE,start.p = 0,start.q = 0,max.p = 5,max.q = 5)
fore<-forecast(a,h = 5)
plot(fore)
