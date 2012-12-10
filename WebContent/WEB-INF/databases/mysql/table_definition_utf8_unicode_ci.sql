-- Create Tables 
-- 이력관리 
-- 컬럼 수정시 연월일 수정 이름 형식으로 남겨주세요. 예) WE_SPACE_DESC VARCHAR(800) COMMENT '위키스페이스설명',  
-- 컬럼 추가, 삭제시  연월일 (추가, 삭제) 이름 형식으로 남기고 주석 처리 하세요. 
-- 새로 생긴 테이블은 제일 하단에  연월일 새로 생성 이름 형식으로 남겨주세요. 

-- 아이피 접근 제어 
CREATE TABLE WE_ACCESS (
	WE_ACCESS_IDX INT(3) NOT NULL AUTO_INCREMENT COMMENT '접근제어순번',
	WE_TARGET_IP VARCHAR(30) COMMENT '대상아이피 ',
	WE_REASON VARCHAR(200) character set utf8 collate utf8_general_ci COMMENT '차단이유',
	WE_START_DATE DATETIME COMMENT '적용시작일',
	WE_END_DATE DATETIME COMMENT '적용종료일',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_INS_USER INT(13) COMMENT '입력자',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_UPD_USER INT(13) COMMENT '수정자',
	WE_UPD_DATE DATETIME COMMENT '수정일',
	PRIMARY KEY (WE_ACCESS_IDX)
) ENGINE = InnoDB COMMENT = '아이피접근제어' DEFAULT character set utf8 collate utf8_general_ci;


-- 관심 맺은 사용자 
CREATE TABLE WE_ADD_FRIEND (
	WE_USER_IDX INT(13) NOT NULL COMMENT '회원순번 : 회원순번',
	WE_TARGET_USER_IDX INT(13) NOT NULL COMMENT '대상자아이디순번 : 대상자아이디순번',
	WE_ADD_DATE DATETIME COMMENT '추가일',
	WE_DEL_DATE DATETIME COMMENT '삭제일',
	WE_USE_YN CHAR(1) COMMENT '사용여부'
) COMMENT = '관심인맥 : 관심을 맺은 사용자의 글 작성된 내역을 확인할 수 있다.' DEFAULT character set utf8 collate utf8_general_ci;


-- 알람 목록 
CREATE TABLE WE_ALARM_INFO (
	WE_ALARM_IDX INT(9) NOT NULL AUTO_INCREMENT COMMENT '알람순번 : 알람순번',
	WE_META_IDX INT(5) NOT NULL COMMENT '업무메타순번 : 업무메타순번',
	WE_ALARM_TYPE CHAR(1) COMMENT '알람타입 : 알람타입 이메일 : E, SMS : S',
	WE_USER_IDX INT(13) NOT NULL COMMENT '회원순번 : 회원순번',
	WE_TARGET_USER_IDX INT(13) COMMENT '대상자아이디순번 : 대상자아이디순번',
	WE_ALARM_TEXT TEXT character set utf8 collate utf8_general_ci COMMENT '알람안내문구(HTML포맷) : 알람안내문구',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_SPACE_IDX INT(5) NOT NULL COMMENT '스페이스순번',
	WE_READ_YN BIT(1) COMMENT '확인여부',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_INS_USER INT(13) COMMENT '입력자',
	PRIMARY KEY (WE_ALARM_IDX)
) ENGINE = InnoDB COMMENT = '사용자액션알람 : 각종 이벤트에 메일 혹은 SMS로 알림을 전송한다.' DEFAULT character set utf8 collate utf8_general_ci;


-- 사이트전체 배너관리
CREATE TABLE WE_BANNER (
	WE_BANNER_IDX INT(5) NOT NULL AUTO_INCREMENT COMMENT '배너순번',
	WE_BANNER_TYPE VARCHAR(20) COMMENT '배너타입 : TOP, BOTTOM, LEFT, RIGHT, HEADER, ',
	WE_STR_DATE DATETIME COMMENT '게시시작일',
	WE_END_DATE DATETIME COMMENT '게시종료일',
	WE_BANNER_INFO VARCHAR(400) COMMENT '배너설명 : 배너설명',
	WE_BANNER_PATH VARCHAR(100) COMMENT '배너경로',
	WE_BANNER_NAME VARCHAR(50) COMMENT '배너파일명',
	WE_BANNER_COMPANY VARCHAR(50) COMMENT '회사명',
	WE_USE_YN CHAR(1) DEFAULT 'Y' COMMENT '사용여부',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_INS_USER INT(13) COMMENT '입력자',
	PRIMARY KEY (WE_BANNER_IDX)
) COMMENT = '위키배너관리 : 사이트전체 배너관리' DEFAULT character set utf8 collate utf8_general_ci;


-- 게시판 
CREATE TABLE WE_BBS (
	WE_BBS_IDX INT(9) NOT NULL AUTO_INCREMENT COMMENT '게시판순번 : 게시판순번',
	WE_SPACE_IDX INT(5) NOT NULL COMMENT '스페이스순번',
	WE_BBS_TITLE VARCHAR(200) character set utf8 collate utf8_general_ci COMMENT '게시판제목',
	WE_BBS_TEXT TEXT character set utf8 collate utf8_general_ci COMMENT '게시판본문 ',
	WE_USER_IP VARCHAR(30) COMMENT '사용자아이피',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_INS_USER INT(13) COMMENT '입력자',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_UPD_USER INT(13) COMMENT '수정자',
	WE_UPD_DATE DATETIME COMMENT '수정일',
	WE_INS_NAME VARCHAR(30) character set utf8 collate utf8_general_ci COMMENT '작성자 이름',
	WE_HIT_COUNT INT(7) COMMENT '조회수',
	PRIMARY KEY (WE_BBS_IDX)
) COMMENT = '위키뉴스게시판' DEFAULT character set utf8 collate utf8_general_ci;


-- 게시판 첨부파일 
CREATE TABLE WE_BBS_ATTACHMENT (
	WE_BBS_IDX INT(9) NOT NULL COMMENT '게시판순번 : 게시판순번',
	WE_FILE_IDX INT(10) COMMENT '첨부파일순번',
	USE_YN CHAR(1) COMMENT '사용여부'
) COMMENT = '게시판 첨부파일 맵핑정보' DEFAULT character set utf8 collate utf8_general_ci;


-- 게시판 댓글 
CREATE TABLE WE_BBS_COMMENT (
	WE_BBS_COMMENT_IDX INT(9) NOT NULL AUTO_INCREMENT COMMENT '게시판댓글순번 : 댓글순번',
	WE_BBS_IDX INT(9) NOT NULL COMMENT '게시판순번 : 게시판순번',
	WE_USER_IP VARCHAR(30) COMMENT '사용자아이피',
	WE_BBS_TEXT TEXT character set utf8 collate utf8_general_ci COMMENT '게시판본문 ',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_INS_NAME VARCHAR(30) COMMENT '작성자 이름',
	WE_INS_USER INT(13) COMMENT '입력자',
	WE_INS_DATE DATETIME COMMENT '입력일',
	PRIMARY KEY (WE_BBS_COMMENT_IDX)
) COMMENT = '게시판댓글정보' DEFAULT character set utf8 collate utf8_general_ci;


-- 즐겨찾기 정보
CREATE TABLE WE_FAVORITE (
	WE_USER_IDX INT(13) NOT NULL COMMENT '회원순번 : 회원순번',
	WE_FAVORITE_TYPE ENUM('SPACE', 'WIKI') NOT NULL COMMENT '즐겨찾기구분타입 : SPACE(공간), WIKI(위키)',
	WE_SPACE_IDX INT(5) COMMENT '스페이스순번',
	WE_WIKI_IDX INT(7) COMMENT '위키번호 : 위키번호',
	WE_USE_YN CHAR(1) NOT NULL COMMENT '사용여부 ',
	WE_ADD_DATE DATETIME COMMENT '추가일',
	WE_DEL_DATE DATETIME COMMENT '삭제일'
) COMMENT = '즐겨찾기 : 즐겨찾기 정보.' DEFAULT character set utf8 collate utf8_general_ci;


-- 파일 업로드 관리
CREATE TABLE WE_FILE (
	WE_FILE_IDX INT(10) NOT NULL AUTO_INCREMENT COMMENT '파일인덱스 : 파일등록인덱스',
	WE_FILE_REAL_NAME VARCHAR(50) character set utf8 collate utf8_general_ci COMMENT '실제파일명',
	WE_FILE_SAVE_NAME VARCHAR(50) COMMENT '저장파일명',
	WE_FILE_SAVE_PATH VARCHAR(100) COMMENT '저장경로',
	WE_FILE_TYPE VARCHAR(10) COMMENT '파일확장자',
	WE_THUMB_NAME VARCHAR(50) COMMENT '썸네일명',
	WE_THUMB_PATH VARCHAR(100) COMMENT '썸네일경로',
	WE_FILE_SIZE INT(20) COMMENT '파일용량',
	WE_THUMB_YN CHAR(1) COMMENT '썸네일여부 : 섬네일일경우Y,N',
	WE_USER_IDX INT(13) COMMENT '회원순번 : 회원순번',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_INS_USER INT(13) COMMENT '입력자',
	PRIMARY KEY (WE_FILE_IDX)
) ENGINE = InnoDB COMMENT = '첨부파일관리 : 파일 업로드 관리' DEFAULT character set utf8 collate utf8_general_ci;


-- 그룹 조직 정보 
CREATE TABLE WE_GROUP_INFO (
	WE_GROUP_IDX INT(5) NOT NULL AUTO_INCREMENT COMMENT '그룹순번',
	WE_GROUP_CODE VARCHAR(50) COMMENT '그룹코드',
	WE_GROUP_NAME VARCHAR(50) character set utf8 collate utf8_general_ci COMMENT '그룹명',
	WE_GROUP_TYPE CHAR(1) COMMENT '그룹형태 : 0:조직, 1:사용자 생성 그룹',
	WE_REQUIRED_YN CHAR(1) COMMENT '필수그룹여부',
	WE_GROUP_OWNER INT(13) COMMENT '그룹오너아이디',
	WE_GROUP_INFO VARCHAR(400) character set utf8 collate utf8_general_ci COMMENT '조직설명',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_INS_USER INT(13) COMMENT '입력자',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_UPD_USER INT(13) COMMENT '수정자',
	WE_UPD_DATE DATETIME COMMENT '수정일',
	PRIMARY KEY (WE_GROUP_IDX)
) ENGINE = InnoDB COMMENT = '그룹정보 : 사용자가 생성하는 그룹 및 회사의 그룹 정보를 저장한다.' DEFAULT character set utf8 collate utf8_general_ci;


-- 그룹에 속한 사용자 
CREATE TABLE WE_GROUP_USER (
	WE_GROUP_IDX INT(5) NOT NULL COMMENT '그룹순번',
	WE_USER_IDX INT(13) NOT NULL COMMENT '회원순번',
	WE_USE_YN CHAR(1) DEFAULT 'Y' COMMENT '사용여부',
	WE_INS_DATE DATETIME NOT NULL COMMENT '입력일',
	WE_INS_USER INT(13) NOT NULL COMMENT '입력자'
) ENGINE = InnoDB COMMENT = '그룹에속한사용자' DEFAULT character set utf8 collate utf8_general_ci;


-- 글라이더의 라이센스를 관리한다.
CREATE TABLE WE_LICENSE (
	WE_LICENSE_IDX INT(7) NOT NULL AUTO_INCREMENT COMMENT '라이센스순번',
	WE_LICENSE_KEY VARCHAR(1000) COMMENT '라이센스발급키 ',
	WE_LICENSE_DATE DATETIME COMMENT '라이센스적용일',
	WE_LICENSE_EXPIRE_DATE DATETIME COMMENT '라이센스만료일 ',
	WE_LICENSE_SALE CHAR(2) COMMENT '판매구분 : BP:비즈니스파트너, SP:자체, PP:개인',
	WE_LICENSE_VENDOR_CODE VARCHAR(30) COMMENT '라이센스판매처명 ',
	WE_LICENSE_COMPANY_NAME VARCHAR(50) COMMENT '라이센스구매회사명 ',
	WE_LICENSE_AUTH_YN CHAR(1) DEFAULT 'N' COMMENT '라이센스인증여부 ',
	WE_LICENSE_AUTH_DATE DATETIME COMMENT '라이센스인증일 ',
	WE_LICENSE_ACTIVE_USER INT(7) COMMENT '사용가능유저수 ',
	WE_LICENSE_ACTIVE_WIKI INT(7) COMMENT '사용가능위키수 ',
	WE_LICENSE_ACTIVE_SPACE INT(5) COMMENT '사용가능공간수 ',
	WE_LICENSE_GRADE CHAR(1) COMMENT '라이센스등급  : O:오픈소스, C:커머셜라이센스, B:중형, E:대형, S:대학, P:개인, T:테스트',
	WE_LICENSE_ITEM_CODE CHAR(1) COMMENT '라이센스적용제품코드  : W:WIKI, I:ISSUE TRACKER, S:배포툴 ',
	PRIMARY KEY (WE_LICENSE_IDX)
) COMMENT = '글라이더 라이센스 정보 : 글라이더의 라이센스를 관리한다.' DEFAULT character set utf8 collate utf8_general_ci;


-- 공간 및 위키 로그 기록 (조직과 사용자)
CREATE TABLE WE_LOG (
	WE_LOG_IDX INT(9) NOT NULL AUTO_INCREMENT COMMENT '로그순번',
	WE_LOG_CODE VARCHAR(30) COMMENT '로그구분코드',
	WE_LOG_DESC VARCHAR(100) character set utf8 collate utf8_general_ci COMMENT '로그설명',
	WE_LOG_PARAM TEXT character set utf8 collate utf8_general_ci COMMENT '로그파라미터',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_INS_USER INT(13) COMMENT '입력자',
	PRIMARY KEY (WE_LOG_IDX)
) ENGINE = InnoDB COMMENT = '사이트로그 : 공간 및 위키 로그 기록 (조직과 사용자)' DEFAULT character set utf8 collate utf8_general_ci;


-- 마크업 태그 목록 활용 
CREATE TABLE WE_MARKUP_TAG (
	WE_MARK_IDX INT(3) NOT NULL AUTO_INCREMENT COMMENT '마크업태그순번',
	WE_MARK_TAG VARCHAR(50) character set utf8 collate utf8_general_ci COMMENT '위키마크업태그',
	WE_MARK_HTML VARCHAR(100) character set utf8 collate utf8_general_ci COMMENT '위키HTML',
	WE_MARK_DESC VARCHAR(200) character set utf8 collate utf8_general_ci COMMENT '태그설명',
	WE_MARK_SAMPLE VARCHAR(400) character set utf8 collate utf8_general_ci COMMENT '마크업태그샘플',
	WE_MARK_EXT_YN CHAR(1) DEFAULT 'N' COMMENT '확장기능여부 : Y:확장, N:기본',
	WE_USE_YN CHAR(1) DEFAULT 'Y' COMMENT '사용여부',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_INS_USER INT(13) COMMENT '입력자',
	PRIMARY KEY (WE_MARK_IDX)
) COMMENT = '위키마크업태그정보' DEFAULT character set utf8 collate utf8_general_ci;


-- 메뉴 
CREATE TABLE WE_MENU (
	WE_MENU_IDX INT(3) NOT NULL AUTO_INCREMENT COMMENT '메뉴순번 : 메뉴순번',
	WE_MENU_NAME VARCHAR(30) character set utf8 collate utf8_general_ci COMMENT '메뉴명 : 메뉴명',
	WE_MENU_ORDER_IDX INT(3) COMMENT '정렬순서 : 정렬순서',
	WE_MENU_PARENT_IDX INT(3) COMMENT '부모순번 : 부모순번',
	WE_MENU_DEPTH INT(1) COMMENT '메뉴깊이 : 메뉴깊이 0:대메뉴, 1:중메뉴, 2:소메뉴',
	WE_MENU_URL VARCHAR(50) character set utf8 collate utf8_general_ci COMMENT '메뉴주소 : 메뉴주소',
	WE_USE_YN CHAR(1) NOT NULL COMMENT '사용여부',
	WE_MENU_TYPE CHAR(1) COMMENT '메뉴구분 : 메뉴구분 S:시스템, M:메인메뉴, T:타이틀메뉴, C:서브메뉴',
	WE_ACCESS_LEVEL INT(1) COMMENT '접근허용레벨 : 접근가능레벨 0-9, 0 : 비회원, 9: 슈퍼관리자',
	WE_MENU_GROUP VARCHAR(10) COMMENT '메뉴그룹 : SPACE,WIKI 그룹 ',
	PRIMARY KEY (WE_MENU_IDX)
) COMMENT = '메뉴관리' DEFAULT character set utf8 collate utf8_general_ci;



-- 위키메타정보
CREATE TABLE WE_META_INFO (
	WE_META_IDX INT(5) NOT NULL AUTO_INCREMENT COMMENT '메타순번 : 메타순번',
	WE_META_TYPE CHAR(1) COMMENT '메타업무타입 : 메타업무타입 A:알람, L:로그, S:SMS',
	WE_META_DOMAIN VARCHAR(30) character set utf8 collate utf8_general_ci COMMENT '메타업무명 : 메타업무명',
	WE_META_DESC VARCHAR(400) character set utf8 collate utf8_general_ci COMMENT '메타업무설명 : 메타업무설명',
	WE_META_TABLE_NAME VARCHAR(30) COMMENT '메타테이블명 : 메타테이블명',
	WE_META_TABLE_KEY VARCHAR(30) COMMENT '메타테이블키 : 메타테이블키',
	WE_USE_YN CHAR(1) NOT NULL COMMENT '사용여부',
	PRIMARY KEY (WE_META_IDX)
) ENGINE = InnoDB COMMENT = '위키메타정보 : 위키메타정보 위키 알람 이벤트시 메타 정보를 기준으로 보내기 때문에 기준 업무별로 미리 정' DEFAULT character set utf8 collate utf8_general_ci;

-- 사용자 프로필 정보 
CREATE TABLE WE_PROFILE (
	WE_USER_IDX INT(13) NOT NULL COMMENT '회원순번 : 회원순번',
	WE_USER_EMAIL VARCHAR(50) COMMENT '사용자이메일',
	WE_USER_SITE VARCHAR(100) COMMENT '홈페이지-블로그',
	WE_CELL_NUM1 VARCHAR(4) COMMENT '전화번호1',
	WE_CELL_NUM2 VARCHAR(4) COMMENT '전화번호2',
	WE_CELL_NUM3 VARCHAR(4) COMMENT '전화번호3',
	WE_FILE_REAL_NAME VARCHAR(50) character set utf8 collate utf8_general_ci COMMENT '실제파일명',
	WE_FILE_SAVE_NAME VARCHAR(50) COMMENT '저장파일명',
	WE_FILE_SAVE_PATH VARCHAR(100) COMMENT '저장경로',
	WE_THUMB_PATH VARCHAR(100) COMMENT '썸네일경로',
	WE_THUMB_NAME VARCHAR(50) COMMENT '썸네일명',
	WE_AWAY_YN CHAR(1) DEFAULT 'N' NOT NULL COMMENT '탈퇴여부',
	WE_GRADE INT(1) NOT NULL COMMENT '회원관리등급',
	WE_TECH_YN CHAR(1) DEFAULT 'N' COMMENT '전문사용자여부',
	WE_POINT INT(7) COMMENT '회원포인트',
	WE_VISIT_DATE DATETIME COMMENT '최종방문일',
	WE_INS_DATE DATETIME NOT NULL COMMENT '입력일',
	WE_UPD_DATE DATETIME COMMENT '수정일',
	WE_NOTI_CHECKED CHAR(1) COMMENT '실시간알림창 열기여부 : 실시간알림창 열기여부(Y:연다, N:열지 않는다)'
) ENGINE = InnoDB COMMENT = '사용자 프로필' DEFAULT character set utf8 collate utf8_general_ci;


-- 메일 전송 내역 
CREATE TABLE WE_SEND_MAIL (
	WE_MAIL_IDX INT(7) NOT NULL AUTO_INCREMENT COMMENT '메일전송순번 : 메일전송순번',
	WE_USER_IDX INT(13) NOT NULL COMMENT '회원순번 : 회원순번',
	WE_SEND_STATUS CHAR(1) COMMENT '메일전송상태 :  0:기본 , 1:실패 , 2:관리자재전송 , 3:관리자재전송실패 , 9:성공 ',
	WE_META_DOMAIN VARCHAR(30)  character set utf8 collate utf8_general_ci COMMENT '메타업무명 : 메타업무명',
	WE_LOG_PARAM TEXT character set utf8 collate utf8_general_ci COMMENT '로그파라미터',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_UPD_DATE DATETIME COMMENT '수정일',
	PRIMARY KEY (WE_MAIL_IDX)
) ENGINE = InnoDB COMMENT = '메일전송내역 : 회원가입시 메일 전송 내역을 기록한다.' DEFAULT character set utf8 collate utf8_general_ci;

-- 공간 
CREATE TABLE WE_SPACE (
	WE_SPACE_IDX INT(5) NOT NULL AUTO_INCREMENT COMMENT '스페이스순번',
	WE_SPACE_NAME VARCHAR(100) character set utf8 collate utf8_general_ci NOT NULL COMMENT '위키스페이스이름',
	WE_SPACE_DESC VARCHAR(800) character set utf8 collate utf8_general_ci COMMENT '위키스페이스설명',		
	-- WE_SPACE_DESC 2012.09.24 이남희수정
	WE_VIEW_PRIVACY ENUM('ALLGROUP','GROUP','USER') NOT NULL COMMENT '공간조회권한 : 전체, 그룹, 구성원선택',
	WE_EDIT_PRIVACY ENUM('ALLGROUP','GROUP','USER') NOT NULL COMMENT '공간수정생성권한 : 전체, 그룹, 구성원선택',
	WE_ADMIN_IDX INT(13) NOT NULL COMMENT '어드민아이디',
	WE_SPACE_EXPOSED CHAR(1) NOT NULL COMMENT '노출여부 : 공간정보 메인에 노출여부 Y, N',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_INS_USER INT(13) COMMENT '입력자',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_UPD_USER INT(13) COMMENT '수정자',
	WE_UPD_DATE DATETIME COMMENT '수정일',
	PRIMARY KEY (WE_SPACE_IDX)
) ENGINE = InnoDB COMMENT = '위키스페이스정보' DEFAULT character set utf8 collate utf8_general_ci;

-- 공간의 접근 권한 그룹 
CREATE TABLE WE_SPACE_GROUP (
	WE_SPACE_IDX INT(5) NOT NULL COMMENT '스페이스순번',
	WE_GROUP_IDX INT(5) NOT NULL COMMENT '그룹순번',
	WE_EDIT_PERMIT CHAR(1) NOT NULL COMMENT '수정권한',
	WE_INSERT_PERMIT CHAR(1) NOT NULL COMMENT '입력권한',
	WE_VIEW_PERMIT CHAR(1) NOT NULL COMMENT '조회권한',
	WE_INS_DATE DATETIME NOT NULL COMMENT '입력일'
) ENGINE = InnoDB COMMENT = '공간접근가능그룹' DEFAULT character set utf8 collate utf8_general_ci;


-- 공간 이미지 
CREATE TABLE WE_SPACE_IMAGE (
	WE_SPACE_IMAGE_IDX INT(5) NOT NULL AUTO_INCREMENT COMMENT '공간이미지정보순번',
	WE_SPACE_IDX INT(5) NOT NULL COMMENT '스페이스순번',
	WE_IMG_PATH VARCHAR(100) COMMENT '이미지경로',
	WE_IMG_NAME VARCHAR(50) character set utf8 collate utf8_general_ci COMMENT '이미지명',
	WE_IMG_WIDTH_SIZE INT(5) COMMENT '이미지사이즈',
	WE_IMG_HEIGHT_SIZE INT(5) COMMENT '세로사이즈',
	WE_USED BIT(1) NOT NULL COMMENT '사용여부 ',
	WE_INS_DATE DATETIME NOT NULL COMMENT '입력일',
	PRIMARY KEY (WE_SPACE_IMAGE_IDX)
) ENGINE = InnoDB COMMENT = '공간이미지정보관리' DEFAULT character set utf8 collate utf8_general_ci;


-- 초대 및 가입 신청 
CREATE TABLE WE_SPACE_JOIN (
	WE_SPACE_JOIN_IDX INT(7) NOT NULL AUTO_INCREMENT COMMENT '신청순번',
	WE_SPACE_IDX INT(5) NOT NULL COMMENT '스페이스순번',
	WE_JOIN_TYPE ENUM('INVITE','REQUEST') COMMENT '초대-신청구분 : INVITE(동료초대),REQUEST(가입신청)',
	WE_USER_IDX INT(13) COMMENT '초대한회원아이디',
	WE_JOIN_STATUS ENUM('APPROVE','REQUEST','CANCEL','REJECT','REAPPLICATION') COMMENT '현재상태',
	WE_INS_DATE DATETIME NOT NULL COMMENT '입력일',
	WE_INS_USER INT(13) COMMENT '신청자',
	PRIMARY KEY (WE_SPACE_JOIN_IDX)
) ENGINE = InnoDB COMMENT = '공간참여신청 : 비공개위키 혹은 그룹위키일 경우 참여신청을 할 수 있다.' DEFAULT character set utf8 collate utf8_general_ci;

-- 공간 접근 사용자 권한 
CREATE TABLE WE_SPACE_USER (
	WE_SPACE_IDX INT(5) NOT NULL COMMENT '스페이스순번',
	WE_VIEW_PERMIT CHAR(1) COMMENT '조회권한',
	WE_INSERT_PERMIT CHAR(1) COMMENT '입력권한',
	WE_EDIT_PERMIT CHAR(1) COMMENT '수정권한',
	WE_USER_IDX INT(13) COMMENT '초대한회원아이디',
	WE_INS_DATE DATETIME NOT NULL COMMENT '입력일'
) ENGINE = InnoDB COMMENT = '접근허용회원' DEFAULT character set utf8 collate utf8_general_ci;


-- 기본 템플릿 페이지 정보
CREATE TABLE WE_TEMPLATE (
	WE_TEMPLATE_IDX INT(9) NOT NULL AUTO_INCREMENT COMMENT '템플릿순번',
	WE_TEMPLATE_TYPE VARCHAR(20) COMMENT '템플릿타입 : HTML, MARKUP',
	WE_TEMPLATE_TEXT TEXT character set utf8 collate utf8_general_ci COMMENT '템플릿내용',
	WE_TEMPLATE_MARKUP TEXT character set utf8 collate utf8_general_ci COMMENT '팀플릿 내용 markup : 팀플릿 내용 markup',
	WE_TEMPLATE_NAME VARCHAR(100) character set utf8 collate utf8_general_ci COMMENT '템플릿명',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_INS_USER INT(13) COMMENT '입력자',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_UPD_USER INT(13) COMMENT '수정자',
	WE_UPD_DATE DATETIME COMMENT '수정일',
	PRIMARY KEY (WE_TEMPLATE_IDX)
) ENGINE = InnoDB COMMENT = '템플릿정보 : 사용자 정의 및 기본 템플릿 페이지 정보' DEFAULT character set utf8 collate utf8_general_ci;


-- 회원 메인 정보 
CREATE TABLE WE_USER (
	WE_USER_IDX INT(13) NOT NULL AUTO_INCREMENT COMMENT '회원순번 : 회원순번',
	WE_USER_ID VARCHAR(50) NOT NULL UNIQUE COMMENT '아이디 : 회원 아이디 혹은 이메일 - 실제 키 ',
	WE_USER_NAME VARCHAR(30) character set utf8 collate utf8_general_ci COMMENT '회원이름',
	WE_USER_NICK VARCHAR(30) character set utf8 collate utf8_general_ci NOT NULL COMMENT '사용자 닉네임',
	WE_USER_KEY VARCHAR(300) NOT NULL COMMENT '비밀번호 키 : 비밀번호 인증 키',
	WE_USER_PWD VARCHAR(50) NOT NULL COMMENT '회원비밀번호',
	WE_USER_JOIN_DATE DATETIME COMMENT '회원가입일',
	WE_USER_AUTH VARCHAR(10) COMMENT '인증전송값 ',
	WE_USER_AUTH_YN CHAR(1) DEFAULT 'N' COMMENT '회원인증여부',
	WE_USER_AUTH_DATE DATETIME COMMENT '인증일',
	PRIMARY KEY (WE_USER_IDX)
) ENGINE = InnoDB COMMENT = '회원기본 : 가입시 필요한 최소 사항' DEFAULT character set utf8 collate utf8_general_ci;

-- 사용자 선택 알람 
CREATE TABLE WE_USER_ALARM (
	WE_USER_IDX INT(13) NOT NULL COMMENT '회원순번 : 회원순번',
	WE_META_IDX INT(5) NOT NULL COMMENT '메타순번 : 메타순번',
	WE_USE_YN CHAR(1) DEFAULT 'Y' COMMENT '사용여부',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_INS_USER INT(13) COMMENT '입력자'
) ENGINE = InnoDB COMMENT = '사용자선택알람 : 도메인별 사용자가 선택한 알람 항목 적재. USER_IDX 와 USE_YN 이 INDEX로' DEFAULT character set utf8 collate utf8_general_ci;


-- 사용자의 직위 코드
CREATE TABLE WE_USER_JOB (
	WE_USER_POSITION_IDX INT(5) NOT NULL AUTO_INCREMENT COMMENT '직급순번',
	WE_POSITION_CD VARCHAR(30) character set utf8 collate utf8_general_ci COMMENT '직급코드',
	WE_POSITION_NAME VARCHAR(30) character set utf8 collate utf8_general_ci COMMENT '직급명',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_USER_IDX INT(13) COMMENT '회원순번 : 회원순번',
	PRIMARY KEY (WE_USER_POSITION_IDX)
) ENGINE = InnoDB COMMENT = '직위코드 : 사용자의 직위 코드' DEFAULT character set utf8 collate utf8_general_ci;


-- 사용자 직급 테이블
CREATE TABLE WE_USER_POSITION (
	WE_USER_POSITION_IDX INT(5) NOT NULL AUTO_INCREMENT COMMENT '직급순번',
	WE_POSITION_CD VARCHAR(30) character set utf8 collate utf8_general_ci COMMENT '직급코드',
	WE_POSITION_NAME VARCHAR(30) character set utf8 collate utf8_general_ci COMMENT '직급명',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_USER_IDX INT(13) COMMENT '회원순번 : 회원순번',
	PRIMARY KEY (WE_USER_POSITION_IDX)
) ENGINE = InnoDB COMMENT = '직급코드 : 사용자 직급 테이블' DEFAULT character set utf8 collate utf8_general_ci;


-- WIKI 정보 
CREATE TABLE WE_WIKI (
	WE_WIKI_IDX INT(7) NOT NULL AUTO_INCREMENT COMMENT '위키번호 : 위키번호',
	WE_SPACE_IDX INT(5) NOT NULL COMMENT '스페이스순번',
	WE_WIKI_PARENT_IDX INT(7) COMMENT '부모글순번',
	WE_WIKI_ORDER_IDX INT(3) COMMENT '정렬순서',
	WE_WIKI_DEPTH_IDX INT(3) COMMENT '글깊이',
	WE_WIKI_TITLE VARCHAR(200) character set utf8 collate utf8_general_ci NOT NULL COMMENT '제목',
	WE_WIKI_TEXT TEXT character set utf8 collate utf8_general_ci NOT NULL  COMMENT '위키본문내용',
	WE_WIKI_MARKUP TEXT character set utf8 collate utf8_general_ci COMMENT '위키마크업텍스트 : 위키 마크업 ',
	WE_WIKI_REVISION INT(3) NOT NULL COMMENT '현재위키버전정보 : 현재위키버전정보',
	WE_WIKI_STATUS CHAR(1) NOT NULL COMMENT '저장상태 : T:임시, S:저장',
	WE_WIKI_QUOTA INT(3) COMMENT '신고건수',
	WE_WIKI_URL VARCHAR(50) COMMENT '현재페이지URL',
	WE_WIKI_AGREE INT(4) DEFAULT 0 NOT NULL COMMENT '위키공감 : +1',
	WE_WIKI_VIEW_CNT INT(4) DEFAULT 0 NOT NULL COMMENT '위키조회수',
	WE_WIKI_PREV VARCHAR(50) COMMENT '이전페이지정보 ',
	WE_WIKI_NEXT VARCHAR(50) COMMENT '다음페이지정보',
	WE_USER_IP VARCHAR(30) COMMENT '사용자아이피',
	WE_WIKI_PROTECT CHAR(1) DEFAULT '0' COMMENT '보호여부 : 0:기본,1:준보호,2:보호,3:신고,4:삭제예정,6:이의제기,7:토론, 8:삭제복구,9:관리자삭제',
	WE_EDIT_TEXT VARCHAR(100) character set utf8 collate utf8_general_ci COMMENT '위키수정사유 : 위키의 수정 사유를 작성한다.',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_INS_USER INT(13) COMMENT '입력자',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_UPD_USER INT(13) COMMENT '수정자',
	WE_UPD_DATE DATETIME COMMENT '수정일',
	WE_EDIT_YN CHAR(1) COMMENT '위키 편집 가능여부 : 위키 편집 가능여부 Y, N',
	PRIMARY KEY (WE_WIKI_IDX)
) COMMENT = '위키기본정보 : WIKI 작성정보를 저장한다.' DEFAULT character set utf8 collate utf8_general_ci;


-- 위키 공감 사용자
CREATE TABLE WE_WIKI_AGREE (
	WE_VIEW_DATE DATETIME NOT NULL COMMENT '조회일',
	WE_USER_IDX INT(13) NOT NULL COMMENT '회원순번 : 회원순번',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호'
) COMMENT = '위키공감사용자 : 위키 공감 사용자' DEFAULT character set utf8 collate utf8_general_ci;


-- WIKI 리비전정보를 저장한다.
CREATE TABLE WE_WIKI_BAK (
	WE_BAK_IDX INT(7) NOT NULL COMMENT '위키순번',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_WIKI_TITLE VARCHAR(200) character set utf8 collate utf8_general_ci NOT NULL COMMENT '제목',
	WE_WIKI_TEXT TEXT character set utf8 collate utf8_general_ci NOT NULL COMMENT '위키본문내용',
	WE_WIKI_MARKUP TEXT character set utf8 collate utf8_general_ci  NOT NULL COMMENT '위키마크업텍스트 : 위키 마크업 ',
	WE_WIKI_REVISION INT(3) NOT NULL COMMENT '현재위키버전정보 : 현재위키버전정보',
	WE_WIKI_STATUS CHAR(1) NOT NULL COMMENT '저장상태 : T:임시, S:저장',
	WE_USER_IP VARCHAR(30) COMMENT '사용자아이피',
	WE_WIKI_PROTECT CHAR(1) COMMENT '보호여부 : 0:기본,1:준보호,2:보호,3:신고,4:삭제예정,6:이의제기,7:토론, 8:삭제복구,9:관리자삭제',
	WE_EDIT_TEXT VARCHAR(100) character set utf8 collate utf8_general_ci COMMENT '위키수정사유 : 위키의 수정 사유를 작성한다.',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_INS_USER INT(13) COMMENT '입력자',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_UPD_USER INT(13) COMMENT '수정자',
	WE_UPD_DATE DATETIME COMMENT '수정일',
	WE_MOV_DATE DATETIME COMMENT '이동일',
	UNIQUE (WE_BAK_IDX, WE_WIKI_IDX)
) ENGINE = InnoDB COMMENT = '위키기본리비전정보 : WIKI 리비전정보를 저장한다.' DEFAULT character set utf8 collate utf8_general_ci;


-- 위키 댓글 
CREATE TABLE WE_WIKI_COMMENT (
	WE_WIKI_COMMENT_IDX INT(9) NOT NULL AUTO_INCREMENT COMMENT '위키댓글순번 : 위키댓글순번',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_USER_EMAIL VARCHAR(50) COMMENT '사용자이메일',
	WE_USER_ID VARCHAR(50) COMMENT '아이디 : 회원 아이디 혹은 이메일 - 실제 키 ',
	WE_USER_NAME VARCHAR(30) character set utf8 collate utf8_general_ci COMMENT '회원이름',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	WE_USER_IP VARCHAR(30) COMMENT '사용자아이피',
	WE_BBS_TITLE VARCHAR(200) character set utf8 collate utf8_general_ci COMMENT '게시판제목',
	WE_BBS_TEXT TEXT character set utf8 collate utf8_general_ci COMMENT '게시판본문',
	WE_SECRET_YN CHAR(1) DEFAULT 'N' COMMENT '비밀여부',
	WE_RECOMD INT(3) COMMENT '추천수',
	WE_ORD_NUM INT(3) COMMENT '정렬번호',
	WE_DEP_NUM INT(3) COMMENT '깊이',
	WE_REF_NUM INT(9) COMMENT '참조번호',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_INS_USER INT(13) COMMENT '입력자',
	PRIMARY KEY (WE_WIKI_COMMENT_IDX)
) COMMENT = '위키댓글정보' DEFAULT character set utf8 collate utf8_general_ci;


-- 위키 첨부 파일 
CREATE TABLE WE_WIKI_FILE (
	WE_FILE_IDX INT(9) NOT NULL AUTO_INCREMENT COMMENT '파일순번',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_FILE_REAL_NAME VARCHAR(50) character set utf8 collate utf8_general_ci COMMENT '실제파일명',
	WE_FILE_SAVE_NAME VARCHAR(50) COMMENT '저장파일명',
	WE_FILE_SAVE_PATH VARCHAR(100) COMMENT '저장경로',
	WE_THUMB_PATH VARCHAR(100) COMMENT '썸네일경로',
	WE_THUMB_NAME VARCHAR(50) COMMENT '썸네일명',
	WE_FILE_TYPE VARCHAR(10) COMMENT '파일확장자',
	WE_FILE_SIZE INT(20) COMMENT '파일용량',
	WE_WIKI_REVISION INT(3) NOT NULL COMMENT '현재위키버전정보 : 현재위키버전정보',
	WE_FILE_DOWN INT(5) COMMENT '파일다운로드횟수',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	PRIMARY KEY (WE_FILE_IDX)
) ENGINE = InnoDB COMMENT = '위키파일정보' DEFAULT character set utf8 collate utf8_general_ci;


-- 위키 그래프 
CREATE TABLE WE_WIKI_GRAPH (
	WE_GRAPH_IDX INT(7) NOT NULL AUTO_INCREMENT COMMENT '차트순번',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_WIKI_REVISION INT(3) NOT NULL COMMENT '현재위키버전정보 : 현재위키버전정보',
	WE_GRAPH_CNT INT(2) NOT NULL COMMENT '차트갯수',
	WE_USE_YN CHAR(1) NOT NULL COMMENT '사용여부',
	PRIMARY KEY (WE_GRAPH_IDX)
) COMMENT = '위키차트' DEFAULT character set utf8 collate utf8_general_ci;


-- 위키 링크 목록 
CREATE TABLE WE_WIKI_LINK (
	WE_LINK_IDX INT(7) NOT NULL AUTO_INCREMENT COMMENT '링크순번',
	WE_LINK_URL VARCHAR(500) character set utf8 collate utf8_general_ci COMMENT '링크주소',
	WE_LINK_TITLE VARCHAR(100) character set utf8 collate utf8_general_ci COMMENT '링크명',
	WE_LINK_TEXT VARCHAR(400) character set utf8 collate utf8_general_ci COMMENT '링크풀텍스트',
	WE_WIKI_REVISION INT(3) NOT NULL COMMENT '현재위키버전정보 : 현재위키버전정보',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	PRIMARY KEY (WE_LINK_IDX)
) ENGINE = InnoDB COMMENT = '위키링크' DEFAULT character set utf8 collate utf8_general_ci;


-- 위키 작성 로그 
CREATE TABLE WE_WIKI_LOG (
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_WIKI_STATUS CHAR(1) NOT NULL COMMENT '저장상태 : T:임시, S:저장',
	WE_USER_IDX INT(13) NOT NULL COMMENT '회원순번 : 회원순번',
	WE_WIKI_REVISION INT(3) NOT NULL COMMENT '현재위키버전정보 : 현재위키버전정보',
	WE_WIKI_ACTION_TYPE CHAR(1) COMMENT '위키작성구분 : I:작성, U:수정, D:삭제',
	WE_INS_DATE DATETIME NOT NULL COMMENT '입력일'
) ENGINE = InnoDB COMMENT = '위키작성로그' DEFAULT character set utf8 collate utf8_general_ci;


-- 위키 각주 정보 
CREATE TABLE WE_WIKI_NOTE (
	WE_WIKI_NOTE_NUM INT(3) NOT NULL AUTO_INCREMENT COMMENT '각주번호',
	WE_WIKI_NOTE_NAME VARCHAR(40) character set utf8 collate utf8_general_ci COMMENT '각주명',
	WE_WIKI_NOTE_DESC VARCHAR(400) character set utf8 collate utf8_general_ci COMMENT '각주설명',
	WE_WIKI_REVISION INT(3) NOT NULL COMMENT '현재위키버전정보 : 현재위키버전정보',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	PRIMARY KEY (WE_WIKI_NOTE_NUM)
) ENGINE = InnoDB COMMENT = '위키각주정보' DEFAULT character set utf8 collate utf8_general_ci;


-- 위키 컨텐츠목록 
CREATE TABLE WE_WIKI_SUMMARY (
	WE_SUMMARY_IDX INT(9) NOT NULL AUTO_INCREMENT COMMENT '서머리순번',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_WIKI_REVISION INT(3) NOT NULL COMMENT '현재위키버전정보 : 현재위키버전정보',
	WE_SUMMARY_TAG VARCHAR(10) character set utf8 collate utf8_general_ci COMMENT '헤드태그 ',
	WE_SUMMARY_TITLE VARCHAR(400) character set utf8 collate utf8_general_ci COMMENT '요약대상제목',
	WE_USE_YN CHAR(1) COMMENT '사용여부',
	PRIMARY KEY (WE_SUMMARY_IDX)
) ENGINE = InnoDB COMMENT = '컨텐츠요약서머리 : 위키 컨텐츠의 패러그래프 및 헤드 타이틀 서머리' DEFAULT character set utf8 collate utf8_general_ci;


-- 위키 키워드
CREATE TABLE WE_WIKI_TAG (
	WE_WIKI_TAG_IDX INT(7) NOT NULL AUTO_INCREMENT COMMENT '태그순번',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_TAG VARCHAR(30) character set utf8 collate utf8_general_ci COMMENT '태그명',
	WE_WIKI_REVISION INT(3) NOT NULL COMMENT '현재위키버전정보 : 현재위키버전정보',
	WE_INS_DATE DATETIME NOT NULL COMMENT '입력일',
	WE_USE_YN CHAR(1) NOT NULL COMMENT '사용여부',
	PRIMARY KEY (WE_WIKI_TAG_IDX)
) ENGINE = InnoDB COMMENT = '위키태그 : 위키 태그를 저장한다.' DEFAULT character set utf8 collate utf8_general_ci;


-- 위키 조회 사용자 목록 
CREATE TABLE WE_WIKI_VIEWER (
	WE_USER_IDX INT(13) NOT NULL COMMENT '회원순번 : 회원순번',
	WE_WIKI_IDX INT(7) NOT NULL COMMENT '위키번호 : 위키번호',
	WE_VIEW_DATE DATETIME COMMENT '조회일'
) COMMENT = '위키조회사용자 : 위키를 조회한 각 사용자 정보' DEFAULT character set utf8 collate utf8_general_ci;




-- 다운로드 사용자 목록 (인증)
CREATE TABLE WE_INSTALL_USER
(
	WE_INSTALL_USER_IDX INT(7) AUTO_INCREMENT COMMENT '인스톨순번',
	WE_DOMAIN VARCHAR(100) character set utf8 collate utf8_general_ci COMMENT '사용자도메인',
	WE_ACTIVE_KEY VARCHAR(400) COMMENT '액티브키',
	WE_EMAIL VARCHAR(100) COMMENT '이메일',
	WE_INSTALL_DATE DATETIME COMMENT '다운로드일',
	WE_AUTH_YN CHAR(1) NOT NULL COMMENT '인증여부',
	WE_AUTH_DATE DATETIME COMMENT '인증일',
	PRIMARY KEY (WE_INSTALL_USER_IDX)
) COMMENT = '설치사용자정보' DEFAULT character set utf8 collate utf8_general_ci;


-- 현재 위키에 설치된 기능목록
CREATE TABLE WE_FUNCTION
(
	WE_FUNCTION_IDX INT(5) AUTO_INCREMENT COMMENT '기능순번',
	WE_FUNCTION_NAME VARCHAR(50) character set utf8 collate utf8_general_ci COMMENT '기능명',
	WE_FUNCTION_DESC VARCHAR(400) character set utf8 collate utf8_general_ci COMMENT '기능설명',
	WE_FUNCTION_CODE VARCHAR(50) character set utf8 collate utf8_general_ci COMMENT '기능코드명',
	WE_FUNCTION_VER VARCHAR(10) character set utf8 collate utf8_general_ci COMMENT '기능버전',
	WE_FUNCTION_TYPE VARCHAR(3) COMMENT '기능타입 : CLS-클래스, JSP-JSP, LIB-JAR, DBT-테이블, DBI-인서트, DBU-업데이트, LIC-라이센스',
	WE_USE_YN CHAR(1) DEFAULT 'Y' COMMENT '사용여부 : 사용여부',
	WE_EXTEND_YN CHAR(1) COMMENT '사용여부',
	WE_CALL_URL VARCHAR(100) COMMENT '콜백URL',
	WE_INS_DATE DATETIME COMMENT '입력일',
	WE_INS_USER INT(13) COMMENT '입력자',
	PRIMARY KEY (WE_FUNCTION_IDX)
) COMMENT = '위키기능리스트' DEFAULT character set utf8 collate utf8_general_ci;



-- 패치대상파일목록
CREATE TABLE WE_PATCH
(
	WE_PATCH_IDX INT(7) AUTO_INCREMENT COMMENT '패치순번 : 패치순번',
	WE_FUNCTION_IDX INT(5) NOT NULL COMMENT '기능순번',
	WE_FILE_NAME VARCHAR(40) character set utf8 collate utf8_general_ci COMMENT '파일명 : 파일명',
	WE_FILE_PATH VARCHAR(200) character set utf8 collate utf8_general_ci COMMENT '파일경로',
	WE_PATCH_TYPE VARCHAR(10) COMMENT '패치타입 : INSERT, UPDATE, DELETE, CRATE',
	WE_PATCH_PATH VARCHAR(200) COMMENT '패치경로',
	WE_INS_DATE DATETIME COMMENT '적용일 : 적용일',
	PRIMARY KEY (WE_PATCH_IDX)
) COMMENT = '패치대상파일목록' DEFAULT character set utf8 collate utf8_general_ci;


