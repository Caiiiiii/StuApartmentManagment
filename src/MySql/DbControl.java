package MySql;

public class DbControl {
	DBacess db = new DBacess();

		public boolean Login(String userName ,String passWord ){        //��¼��֤
			if(userName==null||userName.equals(""))return false;
			db.createConn();
			String sql="select * from userinfo where username= '"+userName+"' ";
			db.query(sql);
			if(db.next()){
				return (passWord.equals(db.getValue("password")))?true:false;
			}else{
				return false;
			}
		}
		
		public int  Identity(String userName){                 //��Ա���
				db.createConn();
				String sql = "select * from userinfo where username ='"+userName+"' ";
				db.query(sql);
				if(db.next()){
					return Integer.valueOf(db.getValue("identity"));
				}
				else{
				return 0;
				}
				
		}
}
