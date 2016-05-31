package jndi;
import com.mobile.db.DbConn;
import com.mobile.db.pool.DBConnectionManager;
import java.sql.*;
import javax.servlet.ServletContext;
public class OraConn extends DbConn{

    public OraConn()
    {
        connection = null;
        IsBeginTrans = false;
        IsMemDb = false;
        dbpool = null;
        connection = null;
    }

    public void setConnection()
        throws SQLException
    {
        connection = OCreateHome.getConnectionDB();
        IsMemDb = false;
    }

    public void setConnection(String jndiName)
        throws SQLException
    {
        connection = OCreateHome.getConnectionDB(jndiName);
        IsMemDb = false;
    }

    public void setConnection(ServletContext servletContext)
        throws SQLException
    {
        connection = (Connection)servletContext.getAttribute("connection");
        IsMemDb = true;
    }

    public Connection getConnection()
    {
        return connection;
    }

    public boolean isClosed()
        throws SQLException
    {
        if(connection == null)
            return true;
        else
            return connection.isClosed();
    }

    public void closeConnection()
        throws SQLException
    {
        if(IsMemDb)
            return;
        if(!IsBeginTrans && connection != null)
        {
            connection.close();
            connection = null;
        }
    }

    public void setSqlQuery(String SqlQuery)
    {
        this.SqlQuery = SqlQuery;
    }

    public ResultSet getResult()
        throws SQLException, IllegalArgumentException
    {
        if(SqlQuery == null || SqlQuery.equals(""))
            throw new IllegalArgumentException("\u9519\u8BEF\uFF1A\u4F20\u5165\u7684 SQL \u8BED\u53E5\u4E3A\u7A7A!");
        if(connection == null)
            throw new SQLException("\u9519\u8BEF\uFF1A\u8FDE\u63A5\u4E3A\u7A7A!");
        try
        {
            PreparedStatement stm = connection.prepareStatement(SqlQuery, 1004, 1007);
            result = stm.executeQuery();
        }
        catch(Exception ex)
        {
            throw new SQLException("\u9519\u8BEF: RS \u7ED3\u679C\u96C6\u5408\u4E3A\u7A7A!");
        }
        return result;
    }

    public boolean isBeginTrans()
    {
        return IsBeginTrans;
    }

    public void setBeginTrans(boolean isBeginTrans)
    {
        IsBeginTrans = isBeginTrans;
    }

    private Connection connection;
    private boolean IsBeginTrans;
    private boolean IsMemDb;
    public String SqlQuery;
    public ResultSet result;
    private DBConnectionManager dbpool;
}


/*
	DECOMPILATION REPORT

	Decompiled from: E:\WorkSpace\WeiAnDma\WebRoot\WEB-INF\lib\MobileDk.jar
	Total time: 13 ms
	Jad reported messages/errors:
	Exit status: 0
	Caught exceptions:
*/