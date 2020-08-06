CREATE TABLE tbl_stay
(   `stay_code`    	VARCHAR(15)     NOT NULL    COMMENT '��ǰ�ڵ�', 
    `stay_type`     VARCHAR(15)     NOT NULL    COMMENT '��������', 
    `stay_name`     VARCHAR(15)     NOT NULL    COMMENT '��ǰ��', 
    `stay_place`    VARCHAR(15)     NOT NULL    COMMENT '������ġ',
    `stay_address`  VARCHAR(45)     NOT NULL    COMMENT '�ּ�',
    `stay_roomType` VARCHAR(30)     NOT NULL    COMMENT '��������',
    `stay_price`    INT             NOT NULL   COMMENT '���', 
    `stay_max`      INT             NULL       COMMENT '�ִ��ο�', 
    `stay_fileName` VARCHAR(25)     NOT NULL    COMMENT '��������',
    `stay_fileRoom` VARCHAR(25)     NOT NULL    COMMENT '��������',
    `stay_fileInfo` VARCHAR(25)     NOT NULL    COMMENT '��ǰ�Ұ�',
    PRIMARY KEY (stay_code)
);