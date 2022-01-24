/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package terapias;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Zambrano Franco Luiggi
 */
public class metodo_cliente {

    Connection db = null;
    Statement st = null;
    ResultSet rs = null;
    PreparedStatement pst = null;

    Integer id_cliente, edad_cliente;
    String nombre_cliente, apellido_cliente, correo_cliente,telefono_cliente,direccion_cliente;
    String sql;
    Boolean a;

    public void conecciondb() {
        try {
            db = DriverManager.getConnection("jdbc:postgresql://localhost:5433/centro_terapias", "postgres", "valeria1208");
        } catch (SQLException e) {
            System.out.println("Ocurrio un error : " + e.getMessage());
        }
    }

    public void inserta_cliente() throws SQLException {
        a = false;
        if (a == false) {
            conecciondb();
            id_cliente = Integer.valueOf(cliente.a1.getText());
            nombre_cliente = cliente.a2.getText();
            edad_cliente = Integer.valueOf(cliente.a3.getText());
            direccion_cliente = cliente.a4.getText();
            telefono_cliente = cliente.a5.getText();
            correo_cliente = cliente.a6.getText();
            apellido_cliente=cliente.a7.getText();
            
            sql = "insert into cliente (id_cliente,nombre_cliente,edad_cliente,direccion_cliente,telefono_cliente,correo_cliente,apellido_cliente) values (?,?,?,?,?,?,?)";
            pst = db.prepareStatement(sql);
            pst.setInt(1, id_cliente);
            pst.setString(2, nombre_cliente);
            pst.setInt(3, edad_cliente );
            pst.setString(4, direccion_cliente );
            pst.setString(5, telefono_cliente);
            pst.setString(6, correo_cliente);
            pst.setString(7, apellido_cliente );
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null, "Se Guardo...");
        }
    }

    public void actualizar_cliente() throws SQLException {
        if (a == true) {
            conecciondb();
            nombre_cliente = cliente.a2.getText();
            edad_cliente = Integer.valueOf(cliente.a3.getText());
            direccion_cliente = cliente.a4.getText();
            telefono_cliente = cliente.a5.getText();
            correo_cliente = cliente.a6.getText();
            apellido_cliente=cliente.a7.getText();
            
            sql = "update cliente set nombre_cliente=?, edad_cliente=?, direccion_cliente=?, telefono_cliente=?, correo_cliente=?, apellido_cliente=? where id_cliente='" + id_cliente + "'";
            pst = db.prepareStatement(sql);
            pst.setString(1, nombre_cliente);
            pst.setInt(2, edad_cliente );
            pst.setString(3, direccion_cliente );
            pst.setString(4, telefono_cliente);
            pst.setString(5, correo_cliente);
            pst.setString(6, apellido_cliente );
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null, "Se Actualizo...");
        }
    }
    
    public void consultar_cliente() throws SQLException {
        conecciondb();st = db.createStatement();
        id_cliente = Integer.valueOf(cliente.a1.getText());
        rs = st.executeQuery("select * from cliente where id_cliente='" + id_cliente + "'");
        if (rs.next()) {
            a = true;
            cliente.a2.setText(rs.getString(2));//nombre
            cliente.a3.setText(rs.getString(3));//edad 
            cliente.a4.setText(rs.getString(4));//direccion
            cliente.a5.setText(rs.getString(5));//telefono
            cliente.a6.setText(rs.getString(6));//correo
            cliente.a7.setText(rs.getString(7));//apellido
        } else {
            JOptionPane.showMessageDialog(null, "No Existe...");
            a = false;
        }
    }

    public void eliminar_cliente() throws SQLException {
        try {
            if (a == true) {
                conecciondb();
                int resp = JOptionPane.showConfirmDialog(null, "Lo elimina", "ALERTA", JOptionPane.YES_NO_OPTION);
                if (resp != 1) {
                    st.execute("delete from cliente where id_cliente='" + id_cliente + "'");
                    JOptionPane.showMessageDialog(null, "SE ELIMINO, ya que no tiene relación tabla");
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "No se puede eliminar, tiene relación tabla");
        }
    }

    public void limpiar_panel_cliente() {
        cliente.a1.setText("");
        cliente.a2.setText("");
        cliente.a3.setText("");
        cliente.a4.setText("");
        cliente.a5.setText("");
        cliente.a6.setText("");
        cliente.a7.setText("");
    }

    void actualizar_institucion() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
