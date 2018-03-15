package MySql;

import java.sql.PreparedStatement;
import java.sql.SQLException;
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
		
		public boolean hadThisMan(String stuNo){                //判断该学号是否被注册
			db.createConn();
			String sql = "select * from stuinfo where stuNo ="+Integer.valueOf(stuNo);
			db.query(sql);
			if(db.next()){
				return true;
			}
			return false;
		}
		
		public String SlotIsFull(String DromNo){                    //判断是否有这个宿舍且是否有空位
			db.createConn();
			String sql = "select * from drominfo where dromNo ='"+DromNo+"'";
			db.query(sql);
			if(db.next()){
					if(Integer.valueOf(db.getValue("freeSlot"))!=0){
						return "haveSlot";
					}else{
						return "haventSlot";
					}
			}else{
				return "haventDrom";
			}
		}
		
		public boolean stuAdd(StuBena sb){
			db.createConn();
			String sql = "insert into stuinfo(stuNo,stuName,stuSex,stuClass,stuDromNo) values(?,?,?,?,?)";
			try {
				PreparedStatement ps =db.add(sql);
				ps.setInt(1, sb.getStuNo());
				ps.setString(2, sb.getStuName());
				ps.setString(3, sb.getStuSex());
				ps.setString(4, sb.getSutClass());
				ps.setString(5, sb.getStuDromNo());
				ps.execute();
				ps.close();
				return true;
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			return false;	
		}
		
		public void reduceSlot(String dromNo){                //宿舍剩余人数减1
			db.createConn();
			int freeSlot = 0;
			String sql = "select * from drominfo where dromNo ='"+dromNo+"'";
			db.query(sql);
			if(db.next()){
				 freeSlot = Integer.valueOf(db.getValue("freeSlot")) - 1;
				}		
			db.closeStm();
			db.closeRs();
			
			String newSql = "update drominfo set freeSlot ="+freeSlot+" where dromNo ='"+dromNo+"'";
			db.update(newSql);
		}
}
