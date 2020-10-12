#!/usr/bin/env python3
'''
    api-test.py
    Jeff Ondich, 11 April 2016
    Updated 7 October 2020

    An example for CS 257 Software Design. How to retrieve results
    from an HTTP-based API, parse the results (JSON in this case),
    and manage the potential errors.
'''

import sys
import argparse
import json
import urllib.request

API_BASE_URL = ' https://api.covidtracking.com'

def get_state_deaths(state):
    url = f'{API_BASE_URL}/v1/states/{state}/current.json'
    data_from_server = urllib.request.urlopen(url).read()
    string_from_server = data_from_server.decode('utf-8')

    state_data_dictionary = json.loads(string_from_server)

    return state_data_dictionary.get('death')

def get_state_cases(state):
    url = f'{API_BASE_URL}/v1/states/{state}/current.json'
    data_from_server = urllib.request.urlopen(url).read()
    string_from_server = data_from_server.decode('utf-8')

    state_data_dictionary = json.loads(string_from_server)

    return state_data_dictionary.get('positive')

def get_state_total_tests(state):
    url = f'{API_BASE_URL}/v1/states/{state}/current.json'
    data_from_server = urllib.request.urlopen(url).read()
    string_from_server = data_from_server.decode('utf-8')

    state_data_dictionary = json.loads(string_from_server)

    return state_data_dictionary.get('totalTestResults')

def calculate_positivity_rate(state):
    positive = get_state_cases(state)
    total = get_state_total_tests(state)
    return positive/total

def get_state_data(state):
    url = f'{API_BASE_URL}/v1/states/{state}/current.json'
    data_from_server = urllib.request.urlopen(url).read()
    string_from_server = data_from_server.decode('utf-8')

    state_data_dictionary = json.loads(string_from_server)
    print(state_data_dictionary)

def main(args):
    if args.action == 'cases':
        state_cases = get_state_cases(args.state)
        print(f'{args.state} cases: {state_cases}')

    elif args.action == 'deaths':
        state_deaths = get_state_deaths(args.state)
        print(f'{args.state} deaths: {state_deaths}')

    elif args.action == 'positivityrate':
        state_rate = calculate_positivity_rate(args.state)
        print(f'{args.state} positivity rate: {state_rate}')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Get info from COVID-19 data API')

    parser.add_argument('action',
                        metavar='action',
                        help='Type of data to retrieve.',
                        choices=['cases', 'deaths', 'positivityrate'])

    parser.add_argument('state',
    metavar='state',
    help='The state for which you want data. Two letter abbreviation in lowercase')

    args = parser.parse_args()
    main(args)
