# ners570-finalproject

## Basis for Project
The ocean plays a significant role in climate prediction, weather forecasting,
as well as our general understanding of the entire earth system.
Creating efficient and accurate models of the ocean can be an incredible
computational challenge due to the size and complexity of the system.
However, we can use simplified models to look at specific phenomena, such as
tsunamis. Tsunamis are considered shallow water waves because their typical
wavelength is significantly larger than the depth of the ocean. This means they
can be studied using a simplified form of the Navier-Stokes equations known as
the shallow-water equations (SWE), shown below.

$$ \frac{\partial u}{\partial t} + u \dot \grad u = -g \grad \nu $$
$$ \frac{\partial \nu}{\partial t} = -\grad \dot (u(H + \nu)) $$

These are the momentum (top) and mass (bottom) conservation equations subject
to gravitational forcing where H is the equilibrium height of the water column,
and $$\nu$$ is the displacement of the water from its equilibrium height.
