<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Day2.aspx.cs" Inherits="Day2.Day2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid">
                <div class="row">
                    <h3>List Control</h3>
                    <%--NavBar end--%>
                    <nav class="navbar navbar-expand-lg bg-body-tertiary">
                        <div class="container-fluid">
                            <a class="navbar-brand" href="#">Navbar</a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <li class="nav-item">
                                        <a class="nav-link active" aria-current="page" href="#">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#hlAbout">About</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#hlPRAYAS">PRAYAS</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#hlAbout">About</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">List Control
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <asp:HyperLink ID="hldropdown" runat="server" Text="DropDown List" class="dropdown-item"></asp:HyperLink></li>
                                            <li><a class="dropdown-item" href="#">Another action</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                                    </li>
                                </ul>
                                <form class="d-flex" role="search">
                                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                                    <button class="btn btn-outline-success" type="submit">Search</button>
                                </form>
                            </div>
                        </div>
                    </nav>
                    <%--NavBar end--%>
                    <div class="col-12">
                        <asp:RadioButton ID="rbDIET" runat="server" Text="DIET" GroupName="course" />
                        <br />
                        <asp:RadioButton ID="rbDIETDS" runat="server" Text="DIETDS" GroupName="course" />
                        <br />
                        <asp:Button ID="btnSelectCourse" runat="server" Text="Confirm" OnClick="btnSelectCourse_Click" />
                        <br />
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </div>
                    <div id="DIETdeptlist" runat="server">
                        <h3>Department of DIET</h3>
                        <asp:RadioButton ID="rbDIETcomp" runat="server" Text="B.Tech Computer Engineering" GroupName="DIETdept" />
                        <br />
                        <asp:RadioButton ID="rbDIETcivil" runat="server" Text="B.Tech Civil Engineering" GroupName="DIETdept" />
                    </div>
                    <div class="col-12" id="DIETDSdeptlist" runat="server">
                        <h3>Department of DIETDS</h3>
                        <asp:RadioButton ID="rbDIETDScomp" runat="server" Text="Computer Engineering" GroupName="DIETDSdept" />
                        <br />
                        <asp:RadioButton ID="rbDIETDScivil" runat="server" Text="Civil Engineering" GroupName="DIETDSdept" />
                    </div>
                </div>
            </div>
            <asp:HyperLink ID="hlabout" runat="server">
                 <div class="col-lg-12">
      <div class="u-heading-v3-1 du">
        <h2 class="u-heading-v3__title du">About Darshan University</h2>
      </div>
      <p class="text-justify">
        <b>Darshan University (DU)</b> is a prominent institution offering a
        broad slate of academic programs and professional courses at the
        undergraduate, graduate, and postgraduate levels in
        <b>Engineering & Technology, Science, Management,</b> and
        <b>Yoga.</b> The University is located in peaceful and sylvan
        surroundings with a distinctive collegiate structure, about 19 km from
        Rajkot, Gujarat, India. It was established as an Engineering Institute
        in 2009 by <b>Shree G. N. Patel Education & Charitable Trust</b> with
        the objective of imparting quality education and training in various
        fields of Engineering and Technology. It has since been transformed into
        <b>Darshan University</b> through an Act by the
        <b
          >Government of Gujarat under the Gujarat State Private Universities
          (Amendment) Act, 2021 (Act No. 15).</b
        >
      </p>

      <p class="text-justify g-mb-20">
        Since its inception, the institution has grown steadily and created a
        unique identity in the field of Engineering & Technology by implementing
        a skill- and training-based foundation for education. The academic
        environment on campus fosters creativity and encourages the exploration
        of technical skills. Darshan University is committed to the generation
        of knowledge, fostering innovation, and contributing to the development
        of the Nation.
      </p>
    </div>
        </div>
        </asp:HyperLink>
            <asp:HyperLink ID="hlPRAYAS" runat="server">
                <h2 class="u-heading-v3__title du">About PRAYAS</h2>
                <p class="text-justify">
        India is the home of a vast youth workforce, yet the majority remain
        unemployable due to skill mismatches between educational outcomes and
        industry requirements. To address this, we launched
        <b>“PRAYAS – Kausalya Sharamshakti – Samaj Seva Abhiyan,”</b> offering
        <b>cutting-edge awareness and hands‑on training</b> to school and
        engineering students in nearby villages and cities of the
        Saurashtra‑Kutch Region at <b>free of cost.</b> Our motive behind this
        initiative is to convert the demographic dividend into a growth engine,
        which increased their efficiency, able to adopt and implement
        technological advancement and supporting the nation’s drive towards
        Aatmanirbhar Bharat with a clear mission, which is to bridge the gap
        between classroom learning and real‑world industry needs. Our mission is
        helping students to acquire practical competencies so they can become
        industry-ready, empowered, and able to contribute meaningfully to the
        national economy.
      </p>
      <p class="text-justify">
        At the Mechanical Engineering Department of Darshan University, we
        established and formally inaugurated our
        <b>Advanced Technology Laboratory</b> on
        <b>Monday, January 16, 2022.</b> This facility is designed to keep pace
        with emerging global technologies and meet increasing industry skilled
        demand. Its features include technologies like Rapid Prototyping,
        Reverse Engineering, Drone Technology, Extended Reality (AR/VR),
        Industrial Robotics, Industrial Automation, Industrial Metrology and
        Metallurgy, Computer-aided Manufacturing, etc..
      </p>
      <p class="text-justify">
        To support hands‑on training in the technologies listed above, the
        Advanced Technology Laboratory is equipped with the following
        instruments. These tools enable students to explore and develop their
        skills from beginner to expert levels.
      </p>
      <ul class="g-my-10">
        <li>3D Printers (FDM/SLA)</li>
        <li>3D Scanner</li>
        <li>Small and Nano Categories Drones with kits</li>
        <li>AR Display and Head Mounted Displays for AR/VR</li>
        <li>6 in 1 Robotic arms and Arduino Based IOT kits</li>
        <li>Advance Electro pneumatics Kits</li>
        <li>Profile Projector</li>
        <li>Inverted Industrial Microscope</li>
        <li>CNC Turning center and VMC</li>
        <li>CO2 based Laser Cutting and Engraving Machine</li>
      </ul>
      <p class="text-justify">
        Our faculty members are fully trained in all advanced equipment. For
        better and effective learning outcomes, they have created structured
        training modules for each technology, covering three progressive levels:
        <b>basic, intermediate,</b> and <b>advance.</b>
      </p>
      <p class="text-justify">
        Our dedicated and skilled faculty members deliver
        <b>free training sessions</b> to school students of
        <b>nearby villages and cities of the Saurashtra‑Kutch Region</b> because
        rural and semi‑urban students often have lack exposure to technical and
        engineering fields, so this initiative helps to prevent students from
        choosing streams blindly and helps them understand what mechanical
        engineering is, what different areas exist, and what career
        opportunities are available.
      </p>
      <p class="text-justify">
        In addition, we provide <b>free-of-cost</b> training to engineering
        students of
        <b>nearby villages and cities of the Saurashtra‑Kutch Region</b> to
        raise awareness and skill levels. This training program helps mechanical
        engineering students to understand how these technologies work and how
        they can be applied in various fields of mechanical engineering.
      </p>
      <p class="text-justify">
        For students who are unable to visit our campus, our faculty members
        conduct outreach training sessions at their premises ensuring
        accessibility and inclusion in skill development by using portable
        equipment such as 3D Scanner, Mini 6 in 1 Robotic Arm, Arduino-based
        Robot Kits, Drone Kits, AR/VR Devices, etc,
      </p>
            </asp:HyperLink>
        <asp:HyperLink ID="hl1" runat="server">

            <asp:Image ID="imgDU1" runat="server" ToolTip="DU1" Width="300px" />
        </asp:HyperLink>
        </div>
    </form>
</body>
</html>
