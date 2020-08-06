CREATE TABLE tbl_reserve
(
    `rsv_idx`        	 INT             NOT NULL    AUTO_INCREMENT COMMENT '예약번호', 
    `rsv_memidx`    	 INT		   	 NOT NULL 	 COMMENT '회원번호',
    `rsv_code`     		 VARCHAR(15)     NOT NULL    COMMENT '상품코드',
    `rsv_date`      	 DATE            NOT NULL    COMMENT '예약일자', 
    `rsv_checkin`  	 	 DATE    		 NOT NULL    COMMENT '체크인', 
    `rsv_checkout` 	 	 DATE			 NOT NULL    COMMENT '체크아웃', 
    `rsv_room`      	 INT             NOT NULL    COMMENT '객실 수', 
    `rsv_addPrice`   	 INT             NULL        COMMENT '추가비용', 
    `rsv_addReason`  	 VARCHAR(45)     NULL        COMMENT '추가비용 사유', 
    `rsv_totalPrice` 	 INT             NOT NULL    COMMENT '총 요금', 
    `rsv_adult`     	 INT             NOT NULL    COMMENT '인원(성인)', 
    `rsv_child`      	 INT             NOT NULL    COMMENT '인원(소아)', 
    `rsv_condition`   	 varchar(15)	 NULL	     COMMENT '예약상태',
    `rsv_cancelFee`   	 INT		 	 NULL	     COMMENT '취소료',
    `rsv_cancelReason`   VARCHAR(45)	 NULL	     COMMENT '취소사유',
    `rsv_refund` 		 INT		 	 NULL	     COMMENT '환불금액',
    PRIMARY KEY (rsv_idx)
);