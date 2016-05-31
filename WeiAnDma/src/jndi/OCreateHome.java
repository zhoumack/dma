package jndi;




import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class OCreateHome {
    public OCreateHome()
    {
    }

    public Object getHomeByJNDI(String jndiName)
        throws Exception
    {
        if(jndiName == null || jndiName.trim().equals(""))
            throw new Exception("JNDI \u540D\u79F0\u4E0D\u80FD\u4E3A\u7A7A!");
        try
        {
            Context context = new InitialContext();
            Object ref = context.lookup(jndiName);
            return ref;
        }
        catch(Exception e)
        {
            throw new Exception((new StringBuilder("\u67E5\u627E\u63A5\u53E3\u9519\u8BEF:")).append(e.toString()).toString());
        }
    }

    public static Connection getConnectionDB()
        throws SQLException
    {
        Connection con = null;
        try
        {
            DataSource ds = null;
            OCreateHome  ch = new OCreateHome();
            String jndiName = "java:jboss//datasources//OracleDMA";
            ds = (DataSource)ch.getHomeByJNDI(jndiName);
            con = ds.getConnection();
            if(con == null)
                throw new Exception("\u8FDE\u63A5\u4E3A\u7A7A!");
        }
        catch(Exception e)
        {
            throw new SQLException((new StringBuilder("\u8FDE\u63A5\u5F02\u5E38:")).append(e.toString()).toString());
        }
        return con;
    }

    public static Connection getConnectionDB(String jndiName)
        throws SQLException
    {
        Connection con = null;
        try
        {
            DataSource ds = null;
            OCreateHome ch = new OCreateHome();
            ds = (DataSource)ch.getHomeByJNDI(jndiName);
            con = ds.getConnection();
            if(con == null)
                throw new Exception("\u8FDE\u63A5\u4E3A\u7A7A!");
        }
        catch(Exception e)
        {
            throw new SQLException((new StringBuilder("\u8FDE\u63A5\u5F02\u5E38:")).append(e.toString()).toString());
        }
        return con;
    }
}


