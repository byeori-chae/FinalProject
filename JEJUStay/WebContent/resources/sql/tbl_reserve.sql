CREATE TABLE tbl_reserve
(
    `rsv_idx`        	 INT             NOT NULL    AUTO_INCREMENT COMMENT '�����ȣ', 
    `rsv_memidx`    	 INT		   	 NOT NULL 	 COMMENT 'ȸ����ȣ',
    `rsv_code`     		 VARCHAR(15)     NOT NULL    COMMENT '��ǰ�ڵ�',
    `rsv_date`      	 DATE            NOT NULL    COMMENT '��������', 
    `rsv_checkin`  	 	 DATE    		 NOT NULL    COMMENT 'üũ��', 
    `rsv_checkout` 	 	 DATE			 NOT NULL    COMMENT 'üũ�ƿ�', 
    `rsv_room`      	 INT             NOT NULL    COMMENT '���� ��', 
    `rsv_addPrice`   	 INT             NULL        COMMENT '�߰����', 
    `rsv_addReason`  	 VARCHAR(45)     NULL        COMMENT '�߰���� ����', 
    `rsv_totalPrice` 	 INT             NOT NULL    COMMENT '�� ���', 
    `rsv_adult`     	 INT             NOT NULL    COMMENT '�ο�(����)', 
    `rsv_child`      	 INT             NOT NULL    COMMENT '�ο�(�Ҿ�)', 
    `rsv_condition`   	 varchar(15)	 NULL	     COMMENT '�������',
    `rsv_cancelFee`   	 INT		 	 NULL	     COMMENT '��ҷ�',
    `rsv_cancelReason`   VARCHAR(45)	 NULL	     COMMENT '��һ���',
    `rsv_refund` 		 INT		 	 NULL	     COMMENT 'ȯ�ұݾ�',
    PRIMARY KEY (rsv_idx)
);