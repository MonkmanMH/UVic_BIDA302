# this wrangles the nyc13flights data using pandas

import pandas as pd
flights = pd.read_csv("data/flights.csv")
flights_SEA = flights[flights['dest'] == "SEA"]
flights_SEA = flights_SEA[['carrier', 'dep_delay', 'arr_delay']]
flights_SEA = flights_SEA.dropna()
print(flights_SEA.head())



