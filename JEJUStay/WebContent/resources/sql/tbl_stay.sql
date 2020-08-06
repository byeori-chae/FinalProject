CREATE TABLE tbl_stay
(   `stay_code`    	VARCHAR(15)     NOT NULL    COMMENT '상품코드', 
    `stay_type`     VARCHAR(15)     NOT NULL    COMMENT '숙박유형', 
    `stay_name`     VARCHAR(15)     NOT NULL    COMMENT '상품명', 
    `stay_place`    VARCHAR(15)     NOT NULL    COMMENT '숙박위치',
    `stay_address`  VARCHAR(45)     NOT NULL    COMMENT '주소',
    `stay_roomType` VARCHAR(30)     NOT NULL    COMMENT '객실종류',
    `stay_price`    INT             NOT NULL   COMMENT '요금', 
    `stay_max`      INT             NULL       COMMENT '최대인원', 
    `stay_fileName` VARCHAR(25)     NOT NULL    COMMENT '메인파일',
    `stay_fileRoom` VARCHAR(25)     NOT NULL    COMMENT '객실파일',
    `stay_fileInfo` VARCHAR(25)     NOT NULL    COMMENT '상품소개',
    PRIMARY KEY (stay_code)
);