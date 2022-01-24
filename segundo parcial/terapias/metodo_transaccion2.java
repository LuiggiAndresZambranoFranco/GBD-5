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
public class metodo_transaccion2 {
    
    DefaultTableModel m1 = new DefaultTableModel();
    Object[] fi = new Object[10];

    Connection db = null;
    Statement st = null;
    ResultSet rs = null;
    PreparedStatement pst = null;

    Integer id_tratamiento, cantidad;
    float  precio;
    String sql, descripcion;
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
                id_tratamiento = Integer.valueOf(transaccion_tratamientos.a1.getText());
                cantidad = Integer.valueOf(transaccion_tratamientos.a2.getText());
                descripcion = String.valueOf(transaccion_tratamientos.a3.getText());
                precio = Float.valueOf(transaccion_tratamientos.a4.getText());

                sql = "insert into tratamientos (id_tratamiento,cantidad,descripcion,precio) values (?,?,?,?)";
                pst = db.prepareStatement(sql);
                pst.setInt(1, id_tratamiento);
                pst.setInt(2, cantidad);
                pst.setString(3, descripcion);
                pst.setFloat(4, precio);
               
                pst.executeUpdate();

                CallableStatement cst = db.prepareCall("call transaccion2()");
                cst.execute();
                PreparedStatement pstnt = db.prepareStatement("select count(id_tratamiento) as error from tratamientos where precio is null");
                rs = pstnt.executeQuery();
                rs.close();
                JOptionPane.showMessageDialog(null, "Se Transfirio con exito");
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "No se puede realizar, se activo el rollback");
        }
    }

    public void actualizar_transaccion() throws SQLException {
        try{
            if (a == true) {
            conecciondb();
            cantidad = Integer.valueOf(transaccion_tratamientos.a2.getText());
            descripcion = transaccion_tratamientos.a3.getText();
            precio = Float.valueOf(transaccion_tratamientos.a4.getText());

            sql = "update tratamientos set cantidad=?, descripcion=?, precio=? where id_tratamiento='" + id_tratamiento + "'";
            pst = db.prepareStatement(sql);
            pst.setInt(1, cantidad);
            pst.setString(2, descripcion);
            pst.setFloat(3, precio);
            pst.executeUpdate();
            CallableStatement cst = db.prepareCall("call transaccion2()");
                cst.execute();
                PreparedStatement pstnt = db.prepareStatement("select count(id_tratamiento) as error from tratamientos where precio is null");
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
        id_tratamiento = Integer.valueOf(transaccion_tratamientos.a1.getText());
        rs = st.executeQuery("select * from tratamientos where id_tratamiento='" + id_tratamiento + "'");
        if (rs.next()) {
            a = true;
            transaccion_tratamientos.a2.setText(rs.getString(2));
            transaccion_tratamientos.a3.setText(rs.getString(3));
            transaccion_tratamientos.a4.setText(rs.getString(4));
        } else {
            JOptionPane.showMessageDialog(null, "No Existe...");
            a = false;
        }
    }
    
    //Consulta general tabla zarpe
    public void general_transaccion() throws SQLException {
        m1.setRowCount(0);
        if (z == 0) {
            m1.addColumn("id_tratamiento");
            m1.addColumn("cantidad");
            m1.addColumn("descripcion");
            m1.addColumn("precio");
            z = 1;
        }
        conecciondb();
        st = db.createStatement();
        rs = st.executeQuery("select *from tratamientos");
        while (rs.next()) {
            fi[0] = rs.getString(1);
            fi[1] = rs.getString(2);
            fi[2] = rs.getString(3);
            fi[3] = rs.getString(4);
            m1.addRow(fi);
            transaccion_tratamientos.jTable2.setModel(m1);
        }
    }

    public void eliminar_transaccion() throws SQLException {
        try {
            if (a == true) {
                conecciondb();
                int resp = JOptionPane.showConfirmDialog(null, "Lo elimina", "ALERTA", JOptionPane.YES_NO_OPTION);
                if (resp != 1) {
                    st.execute("delete from tratamientos where id_tratamiento='" + id_tratamiento + "'");
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
        
        transaccion_tratamientos.a1.setText("");
        transaccion_tratamientos.a2.setText("");
        transaccion_tratamientos.a3.setText("");
        transaccion_tratamientos.a4.setText("");

    }


}
