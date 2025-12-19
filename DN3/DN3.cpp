#include <iostream>
#include <cmath>

using namespace std;

double calcAtan(double* x, int* N_steps)
{
    double r = 0.0;
    double xx = *x;

    for (int n = 0; n < *N_steps; n++)
    {
        r += pow(-1, n) * pow(xx, 2 * n + 1) / (2 * n + 1);
    }
    return r;
}

double f(double x, int* N_steps)
{
    double t = x * x;
    return exp(3.0 * x) * calcAtan(&t, N_steps);
}

int main()
{
    const double a = 0.0;
    const double b = acos(-1.0) / 4.0;

    int n = 1000;
    int N_steps = 50;

    double dx = (b - a) / n;
    double sum = f(a, &N_steps) + f(b, &N_steps);

    for (int i = 1; i < n; i++)
    {
        double x = a + i * dx;
        sum += 2.0 * f(x, &N_steps);
    }

    double integral = dx / 2.0 * sum;

    cout << "Priblizna vrednost integrala: " << integral << endl;
    return 0;
}
