# make a dataframe

import pandas


df = pandas.DataFrame({'A': {0: 'a', 1: 'b', 2: 'c'},
                    'B': {0: 1, 1: 3, 2: 5},
                    'C': {0: 2, 1: 4, 2: 6}})

df


pandas.melt(df, id_vars=['A'], value_vars=['B'])

