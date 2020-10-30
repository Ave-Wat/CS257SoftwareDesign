import csv

#Attempt 1
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
# in the above, the runtime is shit
# STEP 1, Attempt 2: grab the state abbrev w/out duplicates
# use a dictionary: {'AK':0, 'NE':0, 'IA':0, 'MA':0, ...}
# STEP 2, Attempt 2: associate with each state an integer ID
# {'AK':0, 'NE':1, 'IA':2, 'MA':3, ...}
states_dictionary = {}
states_file  = open('all-states-history.csv')
reader = csv.reader(states_file)
rows = []
for row in reader:
    state_abbrev = row[1]
    if state_abbrev not in states_dictionary:
        states_dictionary[state_abbrev] = len(states_dictonary)
states_file.close()

states_csv_file = open('states.csv', 'w')
writer = csv.writer(states_csv_file)
for key in states_dictionary:
    # ...write the appropriate row to the file...
    # (might want to manually add state names to the CSV file: Alabama, Maine,...)
states_csv_file.close()

# STEP 4:
data_csv_file = open('covid19_data.csv', 'w')
writer = csv.writer(data_csv_file)
# re-open all-states-data.csv states_file
# give it a csv.reader
# run thru the rows and write the cols you care about to the writer
# remember: col 1 shouldn't be 'NE', it should be 1 (the ID for Nebraska)
