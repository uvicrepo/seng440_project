// Optimized C code version of the MMM function

int MMM(int X, int Y, int M, int m) {
    int T = 0;
    int Y0 = Y & 1;

    for (int i = 0; i < m; i++) {
        int Xi = (X >> i) & 1;
        int T0 = T & 1;
        int eta = T0 ^ (Xi & Y0);

        // Convert conditional logic into constant-time masking
        int Xi_mask = -Xi;           // 0xFFFFFFFF if Xi == 1, else 0x00000000
        int Xi_Y = Y & Xi_mask;

        int eta_mask = -eta;         // 0xFFFFFFFF if eta == 1, else 0x00000000
        int eta_M = M & eta_mask;

        // Update T using shift instead of division
        T = (T + Xi_Y + eta_M) >> 1;
    }

    // Final modular reduction to ensure T < M (constant time)
    int mask1 = -(T >= M);
    T = T - (M & mask1);

    int mask2 = -(T >= M);
    T = T - (M & mask2);

    return T;
}
