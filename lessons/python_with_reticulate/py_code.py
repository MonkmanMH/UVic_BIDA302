# this tests the import of pandas

import pandas as pd
flights = pd.read_csv("flights.csv")
flights_ORD = flights[flights['dest'] == "ORD"]
flights_ORD = flights_ORD[['carrier', 'dep_delay', 'arr_delay']]
flights_ORD = flights_ORD.dropna()
print(flights_ORD.head())



