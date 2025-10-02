import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.*;

class Account {
    private String name;
    private int accountNumber;
    private double balance;

    public Account(String name, int accountNumber) {
        this.name = name;
        this.accountNumber = accountNumber;
        this.balance = 0.0;
    }

    public void deposit(double amount) {
        if (amount > 0) balance += amount;
    }

    public boolean withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            return true;
        }
        return false;
    }

    public String getAccountInfo() {
        return "<html><b>Account Number:</b> " + accountNumber + 
               "<br><b>Name:</b> " + name + 
               "<br><b>Balance:</b> ₹" + balance + "</html>";
    }
}

public class ModernBankingGUI extends JFrame {
    private Account account;
    private JLabel displayLabel;

    public ModernBankingGUI() {
        setTitle("Modern Banking App");
        setSize(450, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());
        getContentPane().setBackground(new Color(245, 245, 245));

        // Top Panel: Account Creation
        JPanel topPanel = new JPanel(new GridBagLayout());
        topPanel.setBackground(new Color(60, 120, 215));
        topPanel.setBorder(new EmptyBorder(15, 15, 15, 15));
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5,5,5,5);
        gbc.fill = GridBagConstraints.HORIZONTAL;

        JTextField nameField = new JTextField(10);
        JTextField accField = new JTextField(10);
        JButton createBtn = new JButton("Create Account");

        createBtn.setBackground(new Color(0, 153, 76));
        createBtn.setForeground(Color.WHITE);
        createBtn.setFocusPainted(false);
        createBtn.setFont(new Font("Arial", Font.BOLD, 14));

        gbc.gridx = 0; gbc.gridy = 0; topPanel.add(new JLabel("Name:"), gbc);
        gbc.gridx = 1; gbc.gridy = 0; topPanel.add(nameField, gbc);
        gbc.gridx = 0; gbc.gridy = 1; topPanel.add(new JLabel("Account Number:"), gbc);
        gbc.gridx = 1; gbc.gridy = 1; topPanel.add(accField, gbc);
        gbc.gridx = 0; gbc.gridy = 2; gbc.gridwidth = 2; topPanel.add(createBtn, gbc);

        // Center Panel: Display Area
        JPanel centerPanel = new JPanel();
        centerPanel.setBackground(Color.WHITE);
        centerPanel.setBorder(BorderFactory.createLineBorder(new Color(200, 200, 200), 2, true));
        displayLabel = new JLabel("Create an account to get started", SwingConstants.CENTER);
        displayLabel.setFont(new Font("Arial", Font.PLAIN, 16));
        displayLabel.setVerticalAlignment(SwingConstants.TOP);
        centerPanel.setLayout(new BorderLayout());
        centerPanel.add(displayLabel, BorderLayout.CENTER);

        // Bottom Panel: Action Buttons
        JPanel bottomPanel = new JPanel(new GridLayout(1, 3, 15, 10));
        bottomPanel.setBackground(new Color(245, 245, 245));
        bottomPanel.setBorder(new EmptyBorder(10, 10, 10, 10));

        JButton depositBtn = new JButton("Deposit");
        JButton withdrawBtn = new JButton("Withdraw");
        JButton balanceBtn = new JButton("Check Balance");

        JButton[] buttons = {depositBtn, withdrawBtn, balanceBtn};
        for (JButton btn : buttons) {
            btn.setBackground(new Color(60, 120, 215));
            btn.setForeground(Color.WHITE);
            btn.setFocusPainted(false);
            btn.setFont(new Font("Arial", Font.BOLD, 14));
            bottomPanel.add(btn);
        }

        add(topPanel, BorderLayout.NORTH);
        add(centerPanel, BorderLayout.CENTER);
        add(bottomPanel, BorderLayout.SOUTH);

        // Button Actions
        createBtn.addActionListener(e -> {
            String name = nameField.getText().trim();
            int accNum;
            try {
                accNum = Integer.parseInt(accField.getText().trim());
            } catch (NumberFormatException ex) {
                JOptionPane.showMessageDialog(this, "Invalid account number!");
                return;
            }
            if (name.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Name cannot be empty!");
                return;
            }
            account = new Account(name, accNum);
            displayLabel.setText(account.getAccountInfo());
        });

        depositBtn.addActionListener(e -> {
            if (account == null) {
                JOptionPane.showMessageDialog(this, "Please create an account first!");
                return;
            }
            String input = JOptionPane.showInputDialog(this, "Enter amount to deposit:");
            try {
                double amount = Double.parseDouble(input);
                account.deposit(amount);
                displayLabel.setText(account.getAccountInfo());
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(this, "Invalid amount!");
            }
        });

        withdrawBtn.addActionListener(e -> {
            if (account == null) {
                JOptionPane.showMessageDialog(this, "Please create an account first!");
                return;
            }
            String input = JOptionPane.showInputDialog(this, "Enter amount to withdraw:");
            try {
                double amount = Double.parseDouble(input);
                if (account.withdraw(amount)) {
                    displayLabel.setText(account.getAccountInfo());
                } else {
                    JOptionPane.showMessageDialog(this, "Insufficient balance or invalid amount!");
                }
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(this, "Invalid amount!");
            }
        });

        balanceBtn.addActionListener(e -> {
            if (account == null) {
                JOptionPane.showMessageDialog(this, "Please create an account first!");
                return;
            }
            displayLabel.setText(account.getAccountInfo());
        });
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new ModernBankingGUI().setVisible(true));
    }
}
