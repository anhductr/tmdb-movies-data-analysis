# Phân tích dữ liệu phim TMDB

## 1. Giới thiệu

Project thực hành xử lý và phân tích dữ liệu phim TMDB bằng Linux Shell Scripting và AWK.

Mục tiêu là rèn luyện kỹ năng tiền xử lý dữ liệu, lọc, sắp xếp và thống kê dữ liệu bằng các công cụ dòng lệnh Linux.

## 2. Công nghệ sử dụng

- Ubuntu Linux
- Bash Shell Scripting
- AWK
- Các lệnh Linux: sort, cut, head, tail

## 3. Bộ dữ liệu

Sử dụng bộ dữ liệu `tmdb-movies.csv`, bao gồm 21 cột chứa thông tin về các bộ phim như:

- Tên phim
- Ngân sách sản xuất
- Doanh thu
- Ngày phát hành
- Điểm đánh giá
- Đạo diễn
- Diễn viên
- Thể loại phim

## 4. Tiền xử lý dữ liệu

File thực hiện: `preprocess.sh`

Các bước xử lý:

1. Đọc dữ liệu từ file CSV gốc.
2. Ghép các record bị ngắt dòng trong nội dung.
3. Xác định các dấu phẩy nằm bên trong dấu ngoặc kép.
4. Thay các dấu phẩy trong dấu ngoặc kép thành dấu chấm phẩy.
5. Giữ nguyên cấu trúc 21 cột.
6. Xuất dữ liệu đã xử lý ra file `tmdb-movies-clean.csv`.

## 5. Phân tích dữ liệu

File thực hiện: `q1_q7.sh`

Project giải quyết 7 yêu cầu:

1. Sắp xếp danh sách phim theo ngày phát hành giảm dần.
2. Lọc các phim có điểm đánh giá lớn hơn 7.5.
3. Tìm phim có doanh thu cao nhất và thấp nhất.
4. Tính tổng doanh thu của tất cả phim.
5. Tìm 10 phim có lợi nhuận cao nhất.
6. Xác định đạo diễn và diễn viên tham gia nhiều phim nhất.
7. Thống kê số lượng phim theo từng thể loại.

## 6. Cấu trúc project

```text
TMDB-Movies-Project/
├── data/
│   ├── tmdb-movies.csv
│   ├── tmdb-movies-clean.csv
│   ├── movies_sorted.csv
│   ├── movies_rating_above_7.5.csv
│   └── top10_profit.csv
├── preprocess.sh
├── q1_q7.sh
└── README.md
```

## 7. Hướng dẫn chạy

Yêu cầu: Môi trường Linux có Bash và AWK.

Bước 1: Chạy tiền xử lý dữ liệu.

```bash
bash preprocess.sh
```

Bước 2: Chạy chương trình phân tích dữ liệu.

```bash
bash q1_q7.sh
```

## 8. Kiến thức áp dụng

- Thao tác với file trong Linux.
- Xử lý dữ liệu văn bản bằng AWK.
- Sử dụng vòng lặp, điều kiện và mảng.
- Xử lý dữ liệu CSV.
- Sử dụng Pipe và Redirection.
- Lọc, sắp xếp và thống kê dữ liệu.
- Viết và thực thi Shell Script.
