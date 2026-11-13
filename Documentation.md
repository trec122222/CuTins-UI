# CuTins Hack - API Documentation

## `Library:Init(config)`
Khởi tạo giao diện. Tên gốc "CuTins Hack" đã được gắn cứng.
- **config** (table):
  - `Game` (string): Tên game hiển thị ở nút mở.

## `Library:CreateTab(name)`
Tạo tab mới. Trả về `Frame` để truyền vào các hàm con.
- **name** (string): Tên tab (tự động in hoa).

## `Library:CreateSection(parentTab, text)`
Tạo tiêu đề nhóm (như "Combat", "Visual") bên trong tab.
- **parentTab**: Tab trả về từ `CreateTab`.
- **text**: Tiêu đề nhóm.

## `Library:CreateToggle(parent, label, desc, default, callback)`
Tạo công tắc.
- **label** (string): Tên tính năng.
- **desc** (string/nil): Mô tả phụ.
- **default** (boolean): Trạng thái ban đầu.
- **callback**: `function(state) ... end` trả về `true/false`.

## `Library:CreateButton(parent, text, callback)`
Tạo nút bấm.
- **callback**: `function() ... end`.

## `Library:CreateSlider(parent, label, min, max, default, callback)`
Tạo thanh trượt.
- **min/max** (number): Giới hạn dưới/trên.
- **default** (number): Giá trị ban đầu.
- **callback**: `function(value) ... end`.

## `Library:CreateTextBox(parent, label, default, callback)`
Tạo ô nhập văn bản.
- **callback**: Kích hoạt khi mất focus (click ra ngoài).

## `Library:CreateDropdown(parent, label, list, callback)`
Tạo hộp chọn (xổ xuống).
- **list** (table): Mảng các lựa chọn (VD: `{"A", "B", "C"}`).
- **callback**: `function(selected) ... end`.

## `Library:Notify(title, text)`
Hiển thị thông báo ở góc phải màn hình (tự ẩn sau 3s).
