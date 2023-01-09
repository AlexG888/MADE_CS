from sys import argv
import csv


name = argv[1]
l_glob = []
maxx = 0
with open(f"datasets/txt/{name}", "r") as file:
    for line in file:
        line = line.split()
        l = []
        for i in range(len(line)):
            l.append(int(line[i].partition(":")[0]))
            maxx = max(maxx, int(line[i].partition(":")[0]))
        l_glob.append(l)


with open(f"datasets/csv/{name}.csv", "w") as csv_file:
    writer = csv.writer(csv_file, delimiter=",")
    l = list(range(1, maxx + 1))
    l.append("target")
    writer.writerow(l)
    for i in l_glob:
        s = [0] * maxx
        for j in range(1, len(i)):
            s[i[j] - 1] = 1
        if i[0] == 1:
            s.append("+" + str(i[0]))
        else:
            s.append(i[0])
        writer.writerow(s)
print(f"{name} is read")