
### Get MAC Address of container:
```bash
docker inspect <container-id> |grep MacAddress|tr -d ' ,"'|sort -u
```

pip3 install --user conan --break-system-packages

task:
[] handle 02:42:c0:a8:d7:03 vs 02-42-c0-a8-d7-03  => equal


serialcode of pk, prkey, lskey is equal
private_key_6029cbaed40f9_07e8_000a_0004.pem
 public_key_6029cbaed40f9_07e8_000a_0004.pem
    license_6029cbaed40f9_07e8_000a_0004.key


14 (private_key_) + 16 (unicode) + 4 (year) + 4 (month) + 4 (day)
14 + 16 + 4 + 4 + 4 = 42 ký tự.
-> tat ca phu thuoc vao do dai cua unicode, do dai cua unicode thay doi thi sex thay doi


    license_6029cbaed40f9_07e8_000a_0004.key
-> extract: 28 ky tu cuoi
    -> 


Giả sử file_path = "private_key_6029cbaed40f9_07e8_000a_0004.pem", thì:

file_path.rsplit('.', 1) sẽ trả về ["private_key_6029cbaed40f9_07e8_000a_0004", "pem"]
Sau đó, lấy phần tử đầu tiên: "private_key_6029cbaed40f9_07e8_000a_0004"
Cuối cùng, lấy 28 ký tự cuối cùng: "6029cbaed40f9_07e8_000a_0004"
Kết quả là "6029cbaed40f9_07e8_000a_0004".

Vì vậy, serialcode sẽ là chuỗi "6029cbaed40f9_07e8_000a_0004"
