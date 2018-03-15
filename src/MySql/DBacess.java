package MySql;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBacess {
	private String Driver="com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/stuapartmentmangement?useUnicode=true&characterEncoding=UTF-8";
	private String username = "root";
	private String password = "123456";
	private Connection conn;
	private Statement stm;
	private ResultSet rs;
	private  PreparedStatement ps;
		/**
		 * ��װmysql�������*/
	public boolean createConn(){     ///mysql����
		boolean b = false;
		
		try {
			Class.forName(Driver);
			conn = DriverManager.getConnection(url,username,password);
			b=true;  //����
		} catch (ClassNotFoundException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		return b;
		
	}
	
	public boolean update(String sql){    //�޸�����
		boolean b = false;
		try {
			stm = conn.createStatement();
			stm.execute(sql);
			b=true;
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		return b;
	}
	
	public void query(String sql){     //��ѯ����
		try {
			stm = conn.createStatement();
			rs = stm.executeQuery(sql);
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
	}
	
	public boolean next(){       //�ж���������
		boolean b = false;
		try {
			if(rs.next()){
				b=true;
			}
		} catch (SQLException e) {
			// TODO �Զ����ɵ� catch ��
			e.printStackTrace();
		}
		return b;
	}
	
	public String getValue(String field){     //��ȡ���ֶ�ֵ
		
		String value = null;
		
			try {
				if(rs!=null){
				value=rs.getString(field);
				}
			} catch (SQLException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
		
		return value;
	}
	
	public PreparedStatement add(String sql){   //��������
		if(conn!=null){
			try {
				ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				return ps;
			} catch (SQLException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public void closeConn(){    //�ر�����
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
		}
	}
	
	public void closeStm(){
		if(stm!=null){
			try {
				stm.close();
			} catch (SQLException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
		}
	}
	
	public void closeRs(){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO �Զ����ɵ� catch ��
				e.printStackTrace();
			}
		}
	}

	public String getDriver() {
		return Driver;
	}

	public void setDriver(String driver) {
		Driver = driver;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public Statement getStm() {
		return stm;
	}

	public void setStm(Statement stm) {
		this.stm = stm;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
	
}