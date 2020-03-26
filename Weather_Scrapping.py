# -*- coding: utf-8 -*-
"""
Created on Thu Mar 26 23:45:40 2020

@author: jsttzf
"""

from wwo_hist import retrieve_hist_data

import os
os.chdir(r"C:\Users\jsttzf\Documents\COVID-19 Weather Project")

frequency=3
start_date = '11-DEC-2018'
end_date = '11-MAR-2019'
api_key = '68a986e819b548b3952225701202603'
location_list = ['california']

hist_weather_data = retrieve_hist_data(api_key,
                                location_list,
                                start_date,
                                end_date,
                                frequency,
                                location_label = False,
                                export_csv = True,
                                store_df = True)