// Seng 440 Embedded Systems - Term Project
#include <stdio.h>
#include <stdlib.h>

// Original C implementation
int MMM(int X, int Y, int M, int m) {
    int i;
    int T;
    int Xi, T0, Y0;
    int eta;
    int Xi_Y;
    int eta_M;

    T = 0;
    Y0 = Y & 1;
    for (i = 0; i < m; i++) {
        Xi = (X >> i) & 1;
        T0 = T & 1;
        eta = T0 ^ (Xi & Y0);
        Xi_Y = Xi ? Y : 0;
        eta_M = eta ? M : 0;
        T = (T + Xi_Y + eta_M) >> 1;
    }
    while (T >= M)
        T -= M;

    return T;
}

// Declaration for external assembly implementation
extern int MMM_asm(int X, int Y, int M, int m);

    int main(void) {
    int X;
    int Y;
    int Z, Z_asm;
    int M = 3233;
    int m = 12;
    int R = 863;      // 1 << m = 4096, and 4096 mod 3233 = 863
    int R2 = 1179;    // 863 * 863 mod 3233 = 744769 mod 3233 = 1179
    int R_inv = 1742; // 863 * 1742 mod 3233 = 1
    int reminder_in_C;
    int X_scaled, Y_scaled, Z_scaled;

    printf("The algorithm configuration is:\n");
    printf("Bitwidth (m) = %i\n", m);
    printf("Modulus (M) = %i\n", M);
    printf("R = %i\t\t[R mod M = (1 << m) mod M = 4096 mod 3233 = 863]\n", R);
    printf("R^2 = %i\t[R * R mod M = 863 * 863 mod 3233 = 744769 mod 3233 = 1179]\n", R2);
    printf("R^-1 = %i\t[since R * R^-1 mod M = 863 * 1742 mod 3233 = 1]\n\n", R_inv);

    printf("Recall that MMM calculates (X * Y * R^-1) mod M. Let's check that!\n");
    printf("The range for X and Y is 0...%i. Introduce X and Y below:\n", (1 << m) - 1);
    printf("\tX = ");
    scanf("%i", &X);
    printf("\tY = ");
    scanf("%i", &Y);

    // Original C result
    Z = MMM(X, Y, M, m);
    printf("\t[C] Z = (X * Y * R^-1) mod M = %i\n", Z);

    // ASM result
    Z_asm = MMM_asm(X, Y, M, m);
    printf("\t[ASM] Z = (X * Y * R^-1) mod M = %i\n", Z_asm);

    reminder_in_C = (X * Y * R_inv) % M;
    reminder_in_C = reminder_in_C < 0 ? reminder_in_C + M : reminder_in_C;
    printf("Reminder calculated with the brute force in C:\n\t(X * Y * R^-1) %% M = %i\n\n", reminder_in_C);

    printf("Verify the Identity Operation!\n");
    Z = MMM(R, R, M, m);
    Z_asm = MMM_asm(R, R, M, m);
    printf("\t[C] R = MMM(R, R, M, m) = %i\n", Z);
    printf("\t[ASM] R = MMM_asm(R, R, M, m) = %i\n\n", Z_asm);

    printf("Calculate R_inv. The easiest way is to use MMM!\n");
    Z = MMM(1, 1, M, m);
    Z_asm = MMM_asm(1, 1, M, m);
    printf("\t[C] R_inv = MMM(1, 1, M, m) = %i\n", Z);
    printf("\t[ASM] R_inv = MMM_asm(1, 1, M, m) = %i\n\n", Z_asm);

    printf("Calculate Z = (X * Y) mod M\n");

    // C version (scaled)
    X_scaled = MMM(X, R2, M, m);
    Y_scaled = MMM(Y, R2, M, m);
    Z_scaled = MMM(X_scaled, Y_scaled, M, m);
    Z = MMM(Z_scaled, 1, M, m);
    printf("[C] Final result after scaling:\n\tZ = MMM(MMM(MMM(X, R^2), MMM(Y, R^2)), 1) = %i\n", Z);

    // ASM version (scaled)
    X_scaled = MMM_asm(X, R2, M, m);
    Y_scaled = MMM_asm(Y, R2, M, m);
    Z_scaled = MMM_asm(X_scaled, Y_scaled, M, m);
    Z_asm = MMM_asm(Z_scaled, 1, M, m);
    printf("[ASM] Final result after scaling:\n\tZ = MMM_asm(MMM_asm(MMM_asm(X, R^2), MMM_asm(Y, R^2)), 1) = %i\n", Z_asm);

    reminder_in_C = (X * Y) % M;
    reminder_in_C = reminder_in_C < 0 ? reminder_in_C + M : reminder_in_C;
    printf("Reminder calculated with brute-force:\n\t(X * Y) %% M = %i\n", reminder_in_C);

    return 0;
}
