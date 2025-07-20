// Fully hardened MMM implementation with constant-time reduction
int MMM(int X, int Y, int M, int m) {
    int T = 0;
    int Y0 = Y & 1;

    for (int i = 0; i < m; i++) {
        int Xi = (X >> i) & 1;
        int T0 = T & 1;
        int eta = T0 ^ (Xi & Y0);

        // Constant-time masking for conditional operations
        int Xi_mask = -Xi;           // 0xFFFFFFFF if Xi == 1, else 0x00000000
        int Xi_Y = Y & Xi_mask;

        int eta_mask = -eta;         // 0xFFFFFFFF if eta == 1, else 0x00000000
        int eta_M = M & eta_mask;

        // Update T using shift instead of division
        T = (T + Xi_Y + eta_M) >> 1;
    }

    // Constant-time reduction without comparison
    int diff1 = T - M;
    int mask1 = ~(diff1 >> 31);     // 0xFFFFFFFF if T >= M, else 0x00000000
    T = T - (M & mask1);

    int diff2 = T - M;
    int mask2 = ~(diff2 >> 31);
    T = T - (M & mask2);

    return T;
}
