m, n = map(int, input().split())
bodova = list(map(int, input().split()))
indeks = [i for i in range(m)]
ans = [-1 for i in range(m)]
preostalo = list(map(int, input().split()))
preferencije = []
for _ in range(m):
    preferencije.append(list(map(int, input().split())))
for i in range(m):
    for j in range(i+1, m):
        if bodova[i] < bodova[j]:
            bodova[i], bodova[j] = bodova[j], bodova[i]
            indeks[i], indeks[j] = indeks[j], indeks[i]
        if bodova[i]==bodova[j] and indeks[i] > indeks[j]:
            bodova[i], bodova[j] = bodova[j], bodova[i]
            indeks[i], indeks[j] = indeks[j], indeks[i]
for i in indeks:
    for rad in preferencije[i]:
        if preostalo[rad-1]:
            preostalo[rad-1]-=1
            ans[i]=rad
            break
print(*ans)
