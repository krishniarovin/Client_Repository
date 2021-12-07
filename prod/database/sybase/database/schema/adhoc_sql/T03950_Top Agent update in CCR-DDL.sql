/* T03950_Top Agent update in CCR DDL */
CREATE TABLE AgentStatusHistory 
(
    PersIDNum       T_ud_id_num   NOT NULL,
    UserCrtd        T_ud_user_id  NOT NULL,
    DateCrtd        T_ud_datetime NOT NULL,
    YNFlag          Char(1)       NOT NULL,
    TPAgent         Char(1)       NOT NULL  
)