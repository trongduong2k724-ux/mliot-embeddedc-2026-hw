#include <stdint.h>
#include <stdio.h>

typedef union {
    float fval;
    uint32_t uval;
    uint8_t bytes[4];
} FloatConverter_t;

int main() {
    FloatConverter_t conv;
    conv.fval = 3.14f;

    // Trích xuất các byte
    uint8_t b0 = conv.bytes[0];
    uint8_t b1 = conv.bytes[1];
    uint8_t b2 = conv.bytes[2];
    uint8_t b3 = conv.bytes[3];

    // ĐÃ SỬA: Chỉ truyền tên biến b0, b1, b2, b3 vào đây thôi
    printf("Dang thap phan: %u %u %u %u\n", b0, b1, b2, b3);
    
    // Mẹo: In dạng Hex (Hexadecimal) nhìn sẽ giống bộ nhớ máy tính hơn
    printf("Dang Hex: 0x%02X 0x%02X 0x%02X 0x%02X\n", b0, b1, b2, b3);

    return 0;
}