/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package terapias;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Zambrano Franco Luiggi
 */
public class metodo_transaccion {
    
    DefaultTableModel m1 = new DefaultTableModel();
    Object[] fi = new Object[10];

    Connection db = null;
    Statement st = null;
    ResultSet rs = null;
    PreparedStatement pst = null;

    Integer id_sueldo, hora_extra;
    float aumento, sueldos, sueldo_total,edad_cliente;
    String sql;
    Boolean a;
    int z;

    public void conecciondb() {
        try {
            db = DriverManager.getConnection("jdbc:postgresql://localhost:5433/terapias", "postgres", "valeria1208");
        } catch (SQLException e) {
            System.out.println("Ocurrio un error : " + e.getMessage());
        }
    }

    public void insertar_transaccion() throws SQLException {
        try {
            a = false;
            if (a == false) {
                conecciondb();
                id_sueldo = Integer.valueOf(transaccion_sueldo.a1.getText());
                hora_extra = Integer.valueOf(transaccion_sueldo.a2.getText());
                aumento = Float.valueOf(transaccion_sueldo.a3.getText());
                sueldos = Float.valueOf(transaccion_sueldo.a4.getText());
                sueldo_total = Float.valueOf(transaccion_sueldo.a5.getText());

                sql = "insert into sueldo (id_sueldo,hora_extra,aumento,sueldos,sueldo_total) values (?,?,?,?,?)";
                pst = db.prepareStatement(sql);
                pst.setInt(1, id_sueldo);
                pst.setInt(2, hora_extra);
                pst.setFloat(3, aumento);
                pst.setFloat(4, sueldos);
                pst.setFloat(5, sueldo_total);
               
                pst.executeUpdate();

                CallableStatement cst = db.prepareCall("call transaccion()");
                cst.execute();
                PreparedStatement pstnt = db.prepareStatement("select count(id_sueldo) as error from sueldo where sueldo_total is null");
                rs = pstnt.executeQuery();
                rs.close();
                JOptionPane.showMessageDialog(null, "Se Transfirio con exito");
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "No se puede realizar, se activo el rollback");
        }
    }

    public void actualizar_transaccion() throws SQLException {
        try {
            if (a == true) {
            conecciondb();
            hora_extra = Integer.valueOf(transaccion_sueldo.a2.getText());
            aumento = Float.valueOf(transaccion_sueldo.a3.getText());
            sueldos = Float.valueOf(transaccion_sueldo.a4.getText());
            sueldo_total = Float.valueOf(transaccion_sueldo.a5.getText());

            sql = "update sueldo set hora_extra=?, aumento=?, sueldos=?, sueldo_total=? where id_sueldo='" + id_sueldo + "'";
            pst = db.prepareStatement(sql);
            pst.setInt(1, hora_extra);
            pst.setFloat(2, aumento);
            pst.setFloat(3, sueldos);
            pst.setFloat(4, sueldo_total);
            pst.executeUpdate();
            CallableStatement cst = db.prepareCall("call transaccion()");
                cst.execute();
                PreparedStatement pstnt = db.prepareStatement("select count(id_sueldo) as error from sueldo where sueldo_total is null");
                rs = pstnt.executeQuery();
                rs.close();
            JOptionPane.showMessageDialog(null, "Se Actualizo...");
        }
            } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "No se puede realizar, se activo el rollback");
        }
    }

    public void consultar_transaccion() throws SQLException {
        conecciondb();
        st = db.createStatement();
        id_sueldo = Integer.valueOf(transaccion_sueldo.a1.getText());
        rs = st.executeQuery("select * from sueldo where id_sueldo='" + id_sueldo + "'");
        if (rs.next()) {
            a = true;
            transaccion_sueldo.a2.setText(rs.getString(2));
            transaccion_sueldo.a3.setText(rs.getString(3));
            transaccion_sueldo.a4.setText(rs.getString(4));
            transaccion_sueldo.a5.setText(rs.getString(5));
        } else {
            JOptionPane.showMessageDialog(null, "No Existe...");
            a = false;
        }
    }
    
    //Consulta general tabla zarpe
    public void general_transaccion() throws SQLException {
        m1.setRowCount(0);
        if (z == 0) {
            m1.addColumn("id_sueldo");
            m1.addColumn("hora_extra");
            m1.addColumn("aumento");
            m1.addColumn("sueldos");
            m1.addColumn("sueldo_total");
            z = 1;
        }
        conecciondb();
        st = db.createStatement();
        rs = st.executeQuery("select *from sueldo");
        while (rs.next()) {
            fi[0] = rs.getString(1);
            fi[1] = rs.getString(2);
            fi[2] = rs.getString(3);
            fi[3] = rs.getString(4);
            fi[4] = rs.getString(5);
            m1.addRow(fi);
            transaccion_sueldo.jTable2.setModel(m1);
        }
    }

    public void eliminar_transaccion() throws SQLException {
        try {
            if (a == true) {
                conecciondb();
                int resp = JOptionPane.showConfirmDialog(null, "Lo elimina", "ALERTA", JOptionPane.YES_NO_OPTION);
                if (resp != 1) {
                    st.execute("delete from sueldo where id_sueldo='" + id_sueldo + "'");
                    JOptionPane.showMessageDialog(null, "SE ELIMINO, ya que no tiene relación tabla");
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "No se puede eliminar, tiene relación tabla");
        }
    }

    public void limpiar_panel_transaccion() {
        for (int i = m1.getRowCount() - 1; i >= 0; i--) {
            m1.removeRow(i);
        };
        
        transaccion_sueldo.a1.setText("");
        transaccion_sueldo.a2.setText("");
        transaccion_sueldo.a3.setText("");
        transaccion_sueldo.a4.setText("");
        transaccion_sueldo.a5.setText("");

    }


}
