package MySql;

import java.util.ArrayList;
import java.util.List;

import Bean.StuBena;

public class DbControl {
	DBacess db = new DBacess();

		public boolean Login(String userName ,String passWord ){        //登录验证
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
		
		public int  Identity(String userName){                 //人员身份
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
		
		public List<StuBena> stuNameInfo(String stuName){            //根据姓名查询
				db.createConn();
				List<StuBena> list = new ArrayList();
				String sql ="select * from stuinfo where stuName ='"+stuName+"'";
				db.query(sql);
				while(db.next()){
					StuBena sb = new StuBena();
					sb.setStuName(stuName);
					sb.setStuSex(db.getValue("stuSex"));
					sb.setSutClass(db.getValue("stuClass"));
					sb.setStuDromNo(db.getValue("stuDromNo"));
					sb.setStuNo(Integer.valueOf(db.getValue("stuNo")));
					list.add(sb);
				}
				
				return (list.size()>=1)?list:null;
		}
		
		public List<StuBena> stuNoInfo(int stuNo){            //根据学号查询
			db.createConn();
			List<StuBena> list = new ArrayList();
			String sql ="select * from stuinfo where stuNo ="+stuNo;
			db.query(sql);
			while(db.next()){
				StuBena sb = new StuBena();
				sb.setStuNo(stuNo);
				sb.setStuSex(db.getValue("stuSex"));
				sb.setSutClass(db.getValue("stuClass"));
				sb.setStuDromNo(db.getValue("stuDromNo"));
				sb.setStuName(db.getValue("stuName"));
				list.add(sb);
			}	
			db.closeRs();
			db.closeStm();
			db.closeConn();
			return (list.size()>=1)?list:null;
	}
		
}
