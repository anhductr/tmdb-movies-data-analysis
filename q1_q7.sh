#!/bin/bash

# Cau 1: Sap xep phim theo ngay phat hanh giam dan

head -n 1 tmdb-movies-clean.csv > movies_sorted.csv

tail -n +2 tmdb-movies-clean.csv |
awk -F',' '{print $19 "/" $16 "," $0}' |
sort -t'/' -k1,1nr -k2,2nr -k3,3nr |
cut -d',' -f2- >> movies_sorted.csv


# Cau 2: Loc phim co diem > 7.5

head -n 1 tmdb-movies-clean.csv > movies_rating_above_7.5.csv

tail -n +2 tmdb-movies-clean.csv |
awk -F',' '$18 > 7.5' >> movies_rating_above_7.5.csv


# Cau 3: Doanh thu cao nhat va thap nhat

echo "Doanh thu cao nhat:"

tail -n +2 tmdb-movies-clean.csv |
awk -F',' '{print $5 "," $0}' |
sort -t',' -k1,1nr |
head -n 1 |
cut -d',' -f2-

echo "Doanh thu thap nhat:"

tail -n +2 tmdb-movies-clean.csv |
awk -F',' '{print $5 "," $0}' |
sort -t',' -k1,1n |
head -n 1 |
cut -d',' -f2-


# Cau 4: Tong doanh thu

echo "Tong doanh thu:"

awk -F',' 'NR!=1 {x += $5} END {printf "%.0f\n", x}' tmdb-movies-clean.csv


# Cau 5: Top 10 phim co loi nhuan cao nhat

head -n 1 tmdb-movies-clean.csv > top10_profit.csv

tail -n +2 tmdb-movies-clean.csv |
awk -F',' '{print $5-$4 "," $0}' |
sort -t',' -k1,1nr |
head -n 10 |
cut -d',' -f2- >> top10_profit.csv


# Cau 6: Dao dien va dien vien xuat hien nhieu nhat

echo "Dao dien:"

tail -n +2 tmdb-movies-clean.csv |
awk -F',' '{print $9}' |
awk -F'|' '{
    for (i=1; i<=NF; i++)
        if ($i != "")
            a[$i]++
}
END {
    for (i in a)
        print a[i], i
}' |
sort -k1,1nr |
head -n 1

echo "Dien vien:"

tail -n +2 tmdb-movies-clean.csv |
awk -F',' '{print $7}' |
awk -F'|' '{
    for (i=1; i<=NF; i++)
        if ($i != "")
            a[$i]++
}
END {
    for (i in a)
        print a[i], i
}' |
sort -k1,1nr |
head -n 1


# Cau 7: Thong ke so phim theo the loai

echo "Thong ke the loai:"

tail -n +2 tmdb-movies-clean.csv |
awk -F',' '{print $14}' |
awk -F'|' '{
    for (i=1; i<=NF; i++)
        if ($i != "")
            a[$i]++
}
END {
    for (i in a)
        print a[i], i
}' |
sort -k1,1nr
