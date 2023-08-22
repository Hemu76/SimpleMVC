package emp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class JDBC {
	public ArrayList<Employee> con() {
		ArrayList<Employee> ae = null;

		try {
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://192.168.110.48:5432/plf_training",
					"plf_training_admin", "pff123");
			Statement smt = con.createStatement();
			ae = new ArrayList<Employee>();
			ResultSet rs = smt.executeQuery("select * from Hemployee");
			while (rs.next()) {
				// System.out.println(rs.getString(1));
				ae.add(new Employee(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5)));
			}
		} catch (Exception e) {
		}
		return ae;
	}
}
