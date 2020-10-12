'''might miss a state this way - youch'''
'''make a list of state codes to compare to'''
import csv

def get_data():
    states_file  = open('all-states-history.csv')
    reader = csv.reader(states_file)
    rows = []
    for row in reader:
        rows.append(row)
    states_file.close()

    return states_list

def get_lines(states_list):
    state_codes = []
    count = 0;
    for state in states_list:
        if state[1] not in state_codes:
            state_codes.add(state[1])
            if count > 52:
                break
            else:
                count+=1
                output_list.append(line)
    return state_codes
