# Chapter 10: Project Planning, Design and Implementation (AALL10)
*Source: NEC License Exam Preparation Book (https://nec-license.gitbook.io/books)*

> **Exam Weightage**: 10 Marks (Part A Short + Part B Long questions). Passing score is 50% across the 10 units.

## 10.1 Engineering Drawings and Its Concepts

Engineering drawings are a crucial part of the design and manufacturing process. They communicate ideas, specifications, and details about a product or system. These drawings provide visual instructions and technical specifications to engineers, architects, and manufacturers to create a product with accuracy and precision.

***

### 1. Fundamentals of Standard Drawing Sheets

Standard drawing sheets are predefined formats used in engineering drawings. They have specific dimensions and a structured layout to ensure consistency and ease of understanding. These sheets typically follow international standards such as ISO or ANSI.

* **Size**:

  The most common sizes are A0, A1, A2, A3, and A4, with A0 being the largest.

  * **A0**: The largest standard size, measuring **841 mm x 1189 mm** (or **84.1 cm x 118.9 cm**). The area of an A0 sheet is 1 square meter (approximately).
  * **A1**: Half of A0, measuring **594 mm x 841 mm** (or **59.4 cm x 84.1 cm**).
  * **A2**: Half of A1, measuring **420 mm x 594 mm** (or **42 cm x 59.4 cm**).
  * **A3**: Half of A2, measuring **297 mm x 420 mm** (or **29.7 cm x 42 cm**).
  * **A4**: Half of A3, measuring **210 mm x 297 mm** (or **21 cm x 29.7 cm**).
  * Tips

    To get **A2** from **A1**, you halve the dimensions of **A1** in one direction (either length or width).

    * The width of A1 (**594 mm**) becomes the height of A2.
    * The height of A1 (**841 mm**) is halved to get the width of A2.
* **Border and Title Block**:

  Each drawing sheet has a border that defines the usable area, and a title block that contains key information such as the drawing number, title, scale, and name of the designer.



![Diagram Schematic](https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-189821b60c418ecbe1ff3888ed916bc151fdfa63%2F10.1_drawing_sheets.png?alt=media)



* **Scale**:

  Scale is a ratio that represents the relationship between the size of an object and its representation in a drawing. It is used when the object is too large or too small to fit on a standard-sized sheet.

  * **Scale Example**: A drawing scale of 1:2 means that each unit on the drawing represents 2 units in real life (i.e., half the size).
  * **Common Scales**:
    * Full scale: 1:1
    * Half scale: 1:2
    * Double scale: 2:1
    * Reduced scale: 1:5, 1:10, etc.
* **Representative Factor (RF)**

  The **Representative Factor (RF)** is the ratio between the dimensions on a map, drawing, or model and the actual dimensions of the object it represents. It is a way to express the scale of a drawing or map.

  * **Formula**:

    
    \text{RF} = \frac{\text{Distance on Drawing or Map}}{\text{Actual Distance}}
    

    **Usage**: Widely used in maps, models, and scaled drawings to understand the relationship between the representation and real-world dimensions.
  * **Example**:

    * If 1 cm on a map represents 1 km in reality:

    
    \text{RF} = \frac{1 , \text{cm}}{100,000 , \text{cm}} = 1:100,000
    

***

### 2. Line Diagram

A **line diagram** is a simplified drawing that represents an object's geometry or conceptual design using lines. It is commonly used in engineering, architecture, and technical illustrations to highlight features and relationships without excessive detail.

***

**Types of Lines and Their Roles**

1. **Continuous Thick Line (Object/Visible Line)**:
   * **Representation**: Thick, solid line.
   * **Purpose**: Depicts the **visible edges** and contours of an object in a given view.
   * **Example**: The outer edges of a cube or visible features on a mechanical part.
   * **Appearance**: `__________`

***

2. **Dashed Line (Hidden Line)**:
   * **Representation**: Short, evenly spaced dashes.
   * **Purpose**: Represents **hidden or invisible edges** of an object that are not visible in the current view.
   * **Example**: Internal features like holes or slots.
   * **Appearance**: `- - - - - -`

***

3. **Long-Short-Long Line (Center Line)**:
   * **Representation**: Alternating long and short dashes.
   * **Purpose**: Indicates the **geometric center** or axis of symmetry for circular or symmetrical features.
   * **Example**: Center of a hole, circle, or axis of a shaft.
   * **Appearance**: `— · — · —`

***

4. **Thin Continuous Line (Extension Line)**:
   * **Representation**: Thin, solid line.
   * **Purpose**: Extends from the object to indicate the **limits** for dimensioning.
   * **Example**: Shows the dimensions of a block’s width, height, or feature position.
   * **Appearance**: `________`

***

5. **Thin Line with Thick Edges (Sectional Plane)**:
   * **Representation**: Thin line bordered by thick edges.
   * **Purpose**: Marks a **sectional plane** where the object is cut to reveal internal features.
   * **Example**: A vertical or horizontal cut through an object to expose hidden details.
   * **Appearance**: Thin with thick borders.

***

6. **Hatching Line**:
   * **Representation**: Thin, uniformly spaced, diagonal lines.
   * **Purpose**: Used in **sectional views** to indicate areas of the object cut by the sectional plane.
   * **Example**: Cross-section of a solid block or material.
   * **Appearance**:

     ```perl
     /////////
     /////////
     ```

***

7. **Chain Line**:
   * **Representation**: Long dashes alternating with short dashes.
   * **Purpose**: Used to indicate a **special requirement** or **boundary** on the object.
   * **Example**: Identifying a heat-treated zone, surface finish limits, or inspection areas.
   * **Importance**: Highlights specific areas that need attention or additional processing.
   * **Appearance**: `— — · — —`

***

8. **Phantom Line**:
   * **Representation**: Alternating long dash, two short dashes.
   * **Purpose**: Represents **alternate positions** of a part or motion paths.
   * **Example**: A door's swinging motion or a part's alternate placement.
   * **Appearance**: `— · · —`

***

### 3. Dimensions

Dimensions provide the necessary information for the size and shape of the object being drawn. They include:

* **Linear Dimensions**: Indicate lengths, widths, and heights.
* **Angular Dimensions**: Represent angles between lines or surfaces.
* **Radial and Diametric Dimensions**: Used for circles and arcs, showing the radius or diameter.
* **Tolerance**: Defines the allowable variation in size for manufacturing purposes, ensuring parts fit together correctly.



![Diagram Schematic](https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-5c52a0e5cd2052df6a9499ac8279da0a790c1cb1%2F10.1_dimension.png?alt=media)



***

**Types of Projection**

Projections are methods used in technical drawing to represent three-dimensional objects on a two-dimensional surface. They are classified into **parallel projection** and **angular (perspective) projection** based on how the projection rays interact with the object and the plane.



![Diagram Schematic](https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-28ae59a160e25854278f5fbe4bd6f8f07df98835%2F10.1_types_of_projections.png?alt=media)



***

**1. Parallel Projection**

In **parallel projection**, the projection rays (lines) are parallel to each other and perpendicular (or oblique) to the projection plane. This method preserves the true dimensions of the object, making it ideal for technical drawings where accurate measurements are required.

**Types of Parallel Projection:**

1. **Orthographic Projection**:
   * The projection rays are perpendicular to the projection plane.
   * **Usage**: Used for front, top, side views in technical drawings.
   * **Example**: Engineering blueprints.
2. **Axonometric Projection**:
   * The object is tilted relative to the projection plane, showing multiple faces simultaneously.
   * Subtypes:
     * **Isometric Projection**: Equal angles (120°) between the axes; preserves true dimensions along all three axes.
     * **Dimetric Projection**: Two axes have equal angles; dimensions along these axes are preserved.
     * **Trimetric Projection**: Angles between all axes are different; dimensions are scaled independently.
3. **Oblique Projection**:
   * The projection rays are at an oblique angle to the projection plane.
   * **Usage**: Used for showing one face in true size while the depth is distorted.
   * **Example**: Cabinet projection (depth scaled by half).

**Key Characteristics:**

* Maintains the true size and shape of the object.
* Objects are not distorted by perspective.
* Lines parallel in the object remain parallel in the drawing.

***

**2. Angular (Perspective) Projection**

In **perspective projection**, the projection rays converge at a single point called the **projection center** or **station point**. This creates a realistic representation of how objects appear to the human eye, with objects farther away appearing smaller.

**Types of Perspective Projection:**

1. **One-Point Perspective**:
   * All projection lines converge at a single vanishing point.
   * **Usage**: Often used for straight-on views of objects like hallways or roads.
2. **Two-Point Perspective**:
   * Projection lines converge at two vanishing points, usually on the horizon.
   * **Usage**: Used for objects at an angle to the viewer, like buildings or furniture.
3. **Three-Point Perspective**:
   * Projection lines converge at three vanishing points, including one for height.
   * **Usage**: Used for dramatic or complex viewpoints, like looking up at a tall building.

**Key Characteristics:**

* Creates a realistic, life-like view of objects.
* Lines parallel in the object appear to converge in the drawing.
* Distorts sizes and angles based on distance from the viewer.

***

### 4. Orthographic Projection

In orthographic projection, the goal is to represent a three-dimensional object in two dimensions by projecting its views from different directions.

**Some standards view of the orthographic projections:**

* **Front View (Elevation)**:
  * **Description**: This view shows the object as seen from the front, providing a clear look at the height and width of the object.
  * **Plane**: The front view is projected onto a vertical plane.
  * **Position**: Located at the center of the drawing to give the primary understanding of the object.
  * **Key features**: The height and width of the object are visible in this view.
* **Top View (Plan)**:
  * **Description**: This view displays the object from above, providing a clear view of the width and depth.
  * **Plane**: The top view is projected onto a horizontal plane above the front view.
  * **Position**: Placed directly above the front view, with the center aligned.
  * **Key features**: Shows how wide and deep the object is when looking from the top.
* **Side View (Profile)**:
  * **Description**: This view shows the object from one side, typically the right side.
  * **Plane**: The side view is projected onto a vertical plane parallel to the side of the object.
  * **Position**: Placed beside the front view, often to the right.
  * **Key features**: This view provides information about the height and depth of the object.
* **Additional Views**:

  * **Rear View**: Sometimes, a rear view (opposite of the front) is included to show details that are only visible from the back.
  * **Bottom View**: A bottom view can be included to show the underside of the object.
  * **Isometric View**: Occasionally, an isometric or 3D view might be included to provide a more realistic perspective.

  

![Diagram Schematic](https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-d0e12a6da886d81a9d0b23a0ea3187a6aeca02a1%2F10.1_quadrant.png?alt=media)



***

**Types of Projection**

* **First-Angle Projection**: The object is placed between the observer and the projection plane. Common in Europe and Asia.
* **Third-Angle Projection**: The projection plane is between the observer and the object. Common in the USA and Canada.

  

![Diagram Schematic](https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-6d16acc16bcd848ce8367a3766ce7dc8a5bfb291%2F10.1_quadrant_map.png?alt=media)



***

Orthographic projections use projection lines at right angles to the object, which ensures that the **dimensions and shapes are true** to scale.



![Conversion of 3D isometric view to 2D orthographic projection](https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-804b9926a85efa3350848521afaf675a776f30e0%2F10.1_conversion_3d_to_2d.png?alt=media)



***

### 5. Isometric View & Isometric Projection

**Isometric View**:

* A drawing technique used to represent 3D objects on a 2D surface.
* **Key Features**:
  * All three axes are drawn at **equal angles of 120°**.
  * **No foreshortening** of dimensions; objects are scaled equally along all axes.
  * Commonly used in sketches and CAD designs for clear visualization.
* **Purpose**: Provides a realistic yet simplified way to represent objects, making it practical for engineering and technical drawings.

**Isometric Projection**:

* A formal projection method where 3D objects are represented with precise geometric scaling.
* **Key Features**:
  * Similar to the isometric view but involves **mathematical foreshortening** (approx. 82% of true size) to correct distortions.
  * It ensures angles and dimensions are accurate for technical standards.
* **Purpose**: Used when strict adherence to geometric proportions is required, typically in detailed technical documentation.

***

### 6. Pictorial Views

**Pictorial views** are 3D representations of objects that show how the object appears in real life. They provide a more comprehensive view than orthographic projections by presenting the object in perspective.

* **Types of Pictorial Views**:
  * **Isometric View**: As discussed earlier, the object is viewed at equal angles on all three axes.
  * **Perspective View**: Represents an object as it would appear to the human eye, with lines converging at vanishing points.
  * **Axonometric View**: A type of projection where the object is viewed at an angle, typically with unequal scales along each axis.

***

### 7. Sectional Drawing

**Sectional drawings** are used to show the internal features of an object. A section is created by imagining that the object is cut along a plane to reveal the internal structure. The cut surface is then represented in a detailed view.

* **Types of Sectional Views**:
  * **Full Section**: The object is cut completely through the center to show the internal features.
  * **Half Section**: Only half of the object is cut to reveal internal features, the other half is shown in an external view.
  * **Broken-Out Section**: A portion of the object is "broken out" to show internal details without cutting the entire object.
  * **Revolved Section**: A part of the object is rotated to display its features.

In sectional drawings, the cutting plane is indicated by a line marked with arrows, and the internal features are drawn with different line types to distinguish them from external features.

***

**8. Polygon**

**Interior Angles of a Polygon**

The sum of the interior angles of a polygon is given by:

* \text{Sum of Interior Angles} = (n - 2) × 180^\circ

Where:

* ( n ) = Number of sides in the polygon.

***

**Individual Interior Angle (for Regular Polygons):**

If the polygon is **regular** (all sides and angles are equal), the measure of each interior angle can be calculated as:

* \text{Individual Interior Angle} = \frac{(n - 2) × 180^\circ}{n}

### **Conclusion**

Engineering drawings are essential for effectively communicating the design of an object or system. They provide clear instructions and specifications that help transform ideas into tangible products. Understanding concepts such as dimensions, scale, orthographic and isometric projections, pictorial views, and sectional drawings is fundamental for anyone involved in design and manufacturing. These drawings ensure that products are built according to the correct specifications and quality standards.

---

## 10.2 Engineering Economics

Engineering economics is the application of economic principles to the evaluation of engineering projects and investments. It involves assessing the financial viability and risks associated with engineering decisions. This section covers key concepts such as project cash flow, time value of money, and various methodologies used to analyze and compare engineering projects.

***

### 1. Understanding Project Cash Flow

**Project cash flow** represents the inflow and outflow of money during the life cycle of a project. It helps in assessing the financial feasibility of a project by determining whether the revenues generated by the project outweigh the costs.

* **Inflow**: The cash received from the project, such as sales, investments, or cost savings.
* **Outflow**: The cash spent on the project, such as operational costs, equipment, labor, and other capital expenses.
* **Net Cash Flow**: The difference between the inflows and outflows at any given point in time.

To evaluate the project’s viability, these cash flows are typically projected over a specific time period and discounted to their present value using an appropriate discount rate.

***

### 2. Discount Rate, Interest, and Time Value of Money

**Time value of money** is the concept that money available now is worth more than the same amount in the future due to its potential earning capacity. This principle underlies most financial calculations and decision-making.

* **Discount Rate**: The rate at which future cash flows are adjusted to reflect their present value. It reflects the opportunity cost of capital, inflation, and risk.
* **Interest**: The cost of borrowing money or the return on invested capital. Interest is calculated based on the principal amount and the interest rate.
* **Present Value (PV)**: The current value of a future sum of money, discounted at a certain rate over time.
* **Future Value (FV)**: The value of an amount of money at a future time, after accounting for interest or discounting.

**Formula** for calculating the **present value (PV)** of a future cash flow:\
PV = \frac{FV}{(1 + r)^t}

Where:

* FV = \text{Future value,}
* r = \text{Discount rate,}
* t = \text{Time period (years).}

***

**Effective Interest Rate Calculations**

**Problem 1: Effective Interest Rate (EIR) Per Year**\
**Question:** A bank has a nominal interest rate of 9% per annum, compounded quarterly. Calculate the effective interest rate per year.\
**Given:**

* Nominal interest rate r = 9% = 0.09
* Compounding frequency n = 4 (quarterly)

**Formula:**\
EIR = ≤ft(1 + \frac{r}{n}\right)^n - 1

**Solution:**\
EIR = ≤ft(1 + \frac{0.09}{4}\right)^4 - 1 = 0.09308

**Answer:** The effective interest rate per year is **9.308%**.

***

**Problem 2: Effective Interest Rate Per Semi-Annual**\
**Question:** A bank has a nominal interest rate of 9% per annum, compounded quarterly. Calculate the effective interest rate per semi-annual period.\
**Given:**

* Nominal interest rate r = 9% = 0.09
* Compounding frequency n = 4 (quarterly)
* Semi-annual compounding means n = 2 periods per year.

**Formula:**\
EIR_{\text{semi-annual}} = ≤ft(1 + \frac{r}{n}\right)^{n/2} - 1

**Solution:**\
EIR_{\text{semi-annual}} = ≤ft(1 + \frac{0.09}{4}\right)^2 - 1 = 0.04550625

**Answer:** The effective interest rate per semi-annual period is **4.551%**.

***

**Problem 3: Effective Interest Rate Per Month**\
**Question:** A bank has a nominal interest rate of 9% per annum, compounded quarterly. Calculate the effective interest rate per month.\
**Given:**

* Nominal interest rate r = 9% = 0.09
* Compounding frequency n = 4 (quarterly)
* Monthly compounding means n = 12 periods per year.

**Formula:**\
EIR_{\text{monthly}} = ≤ft(1 + \frac{r}{n}\right)^{n/12} - 1

**Solution:**\
EIR_{\text{monthly}} = ≤ft(1 + \frac{0.09}{4}\right)^{1/3} - 1 = 0.007448

**Answer:** The effective interest rate per month is **0.7448%**.

***

**Some Important Financial Formulas**

* **Single-Payment Compound Amount:**\
  F = P(1 + i)^n
* **Single-Payment Present Worth Amount:**\
  P = F \cdot (P/F, i, n) = \frac{F}{(1 + i)^n}
* **Equal-Payment Series Compound Amount:**\
  F = A \cdot (F/A, i, n) = A \cdot \frac{(1 + i)^n - 1}{i}
* **Equal-Payment Series Sinking Fund:**\
  A = F \cdot (A/F, i, n) = F \cdot \frac{i}{(1 + i)^n - 1}
* **Equal-Payment Series Present Worth Amount:**\
  P = A \cdot (P/A, i, n) = A \cdot \frac{(1 + i)^n - 1}{i(1 + i)^n}
* **Equal-Payment Series Capital Recovery Amount:**\
  A = P \cdot (A/P, i, n) = P \cdot \frac{i(1 + i)^n}{(1 + i)^n - 1}
* **Uniform Gradient Series Annual Equivalent Amount:**\
  A = A_1 + G \cdot (A/G, i, n) = A_1 + G \cdot \frac{(1 + i)^n - i \cdot n - 1}{i(1 + i)^n - i}

***

### 3. Basic Methodologies for Engineering Economics Analysis

Engineering economic analysis is a critical aspect of evaluating the feasibility and financial viability of engineering projects. It combines economic and financial principles with engineering knowledge to assess costs, benefits, and risks. Below are some commonly used methodologies in this field:

1. **Payback Period**

The payback period is the time required to recover the initial investment from the cash inflows generated by a project.

**Simple Payback Period:**\
\text{Simple Payback Period} = \frac{\text{Initial Investment}}{\text{Annual Cash Inflow}}

**Decision Rule:**

* **Accept**: If the payback period is less than or equal to the required period.
* **Reject**: If the payback period is greater than the required period.

***

2. **Discounted Payback Period:**

Time taken for the sum of discounted cash inflows to equal the initial investment.

**Formula:**\
\text{Discounted Cash Flow} = \frac{C_t}{(1 + i)^t}

**Decision Rule:**

* **Accept**: If the discounted payback period is less than or equal to the required period.
* **Reject**: If the discounted payback period is greater than the required period.

***

3. **Equivalent Worth Method**

This method involves converting cash flows to a common point in time using the time value of money. Sub-methods include:

* **Present Worth (PW):**

  \
  \text{PW} = \sum \frac{C_t}{(1 + i)^t}

**Decision Rule:**

* **Accept**: If the present worth is greater than or equal to zero (NPV ≥ 0).
* **Reject**: If the present worth is less than zero (NPV < 0).

***

* **Future Worth (FW):**

  \
  \text{FW} = \text{PW} × (1 + i)^n

**Decision Rule:**

* **Accept**: If the future worth is greater than or equal to the initial investment.
* **Reject**: If the future worth is less than the initial investment.

***

* **Annual Worth (AW):**

  \
  \text{AW} = \text{PW} × \frac{i(1 + i)^n}{(1 + i)^n - 1}

**Decision Rule:**

* **Accept**: If the annual worth is greater than or equal to the required minimum annual return.
* **Reject**: If the annual worth is less than the required minimum annual return.

***

4. **Rate of Return Method**

This method calculates the rate of return that a project earns over its life. Here the project cashflow reinvested at the IRR. It includes:

* **Internal Rate of Return (IRR):**

  \
  \text{NPV} = \sum \frac{C_t}{(1 + \text{IRR})^t} - \text{Initial Investment} = 0

**Decision Rule:**

* **Accept**: If the IRR is greater than or equal to the required rate of return.
* **Reject**: If the IRR is less than the required rate of return.

***

* **Minimum Attractive Rate of Return (MARR):**

The MARR is the minimum return that an investor or organization requires from a project, typically based on the cost of capital or opportunity cost of funds. It serves as a benchmark to compare with the IRR to determine the project’s acceptability.

**Decision Rule:**

* **Accept**: If IRR ≥ MARR.
* **Reject**: If IRR < MARR.

***

* **External Rate of Return (ERR):**

Also known as modified internal rate of return. On ERR, here the project cashflow reinvested at the cost of capital not the IRR. Here the slight modification makes the MARR more effective than that of IRR.

**Decision Rule:**

* **Accept**: If the ERR exceeds the cost of capital or required return rate.
* **Reject**: If the ERR is less than the cost of capital or required return rate.

***

5. **Benefit-Cost Ratio (BCR):**

The Benefit-Cost Ratio compares the present value of benefits to the present value of costs.

**Formula:**

\
\text{BCR} = \frac{\text{PV of Benefits}}{\text{PV of Costs}}

***

* **Conventional B/C Ratio:**

  \
  B/C = \frac{\text{PV of (B)}}{1 + \text{PV of (O\&M)} - \text{PV of (Sv)}}

**Where:**

* **PV of Benefits** is the present value of the benefits over the project's life.
* **PV of O\&M Costs** is the present value of the operating and maintenance costs.
* **PV of Salvage Value** is the present value of the value at the end of the project's life.
* **PV of Costs** is the present value of the total project costs (including initial investment and operating costs).

**Decision Rule:**

* **Accept**: If B/C ≥ 1
* **Reject**: If B/C < 1

***

* **Modified B/C Ratio:**

  \
  B/C = \frac{\text{PV of Benefits} - \text{PV of O\&M Costs}}{1 - \text{PV of Salvage Value}}

**Decision Rule:**

* **Accept**: If B/C ≥ 1
* **Reject**: If B/C < 1

***

### 4. Comparison of Alternatives

When comparing multiple project alternatives, various factors are considered, such as:

* **Cost-benefit analysis**: Evaluating the costs and benefits of each alternative.
* **NPV Comparison**: Projects with higher NPVs are generally preferred as they add more value.
* **IRR Comparison**: Projects with higher IRRs are typically more attractive, but the MARR must also be considered.
* **Payback Period**: A shorter payback period is typically more desirable, especially for companies with liquidity concerns.

The comparison helps in choosing the alternative that offers the best financial returns and risk profile.

***

### 5. Depreciation System in Nepal

Depreciation is the process by which a company allocates the cost of a long-term asset over its useful life. This reflects the decrease in the asset's value as it is used in the business. In Nepal, the rules regarding depreciation are governed by the **Income Tax Act**, and companies are allowed to deduct depreciation expenses from their taxable income, which helps reduce their tax burden.

**Methods of Depreciation:**

1. **Straight-Line Method of Depreciation:**

* **Depreciation Charge (Dn) per Year:**

  \
  D_n = \frac{P - S}{N}
* **Where:**
  * P = \text{Cost of the asset, including installation expenses.}
  * S = \text{Salvage value at the end of the asset’s useful life.}
  * N = \text{Useful life of the asset (in years).}
  * D_n = \text{Depreciation charge for each year (uniformly distributed).}
* **Book Value after n Years (Bn):**

  \
  B_n = P - (D_1 + D_2 + ... + D_n)

  **Where:**

  * B_n = \text{Book value of the asset after n years.}
  * D_1, D_2, ..., D_n = Depreciation charges for the years 1, 2, ..., n (which are all the same using the straight-line method

***

2. **Declining Balance Method:**

* **Depreciation Charge (D) per Year:**

  \
  D = C × ≤ft( 1 - ≤ft( \frac{V}{C} \right)^n \right)

  **Where:**

  * D = \text{Depreciation charge for the year.}
  * C = \text{Original cost of the asset.}
  * V = \text{Scrap (or salvage) value of the asset.}
  * n = \text{Useful life of the asset (in years).}

***

3. **Sum-of-Years-Digits (SOYD) Method:**

* **Sum of the Years' Digits (SOYD):**

  \
  SOYD = 1 + 2 + ... + N = \frac{N(N + 1)}{2}

  **Where:**

  * N = \text{Useful life of the asset (in years).}
* **Depreciation Charge (Dn) per Year:**

  \
  D_n = \frac{(N - n + 1)(P - S)}{SOYD}

  **Where:**

  * D_n = \text{Depreciation charge for the nth year.}
  * P = \text{Cost of the asset, including installation expenses.}
  * S = \text{Salvage value at the end of the asset’s useful life.}
  * N = \text{Useful life of the asset (in years).}
  * n = \text{Year in which the depreciation is being calculated (e.g., for year 1, n = 1).}
  * SOYD = \text{Sum of the years' digits.}

***

4. **Sinking Fund Method:**

The Sinking Fund Method of depreciation is used to accumulate funds over time to replace an asset once its useful life has ended. It assumes that a fixed annual deposit is made into a sinking fund, and the interest earned on this fund will cover the depreciation of the asset.

* **Depreciation Charge (Dn) per Year:**

  \
  D_n = \frac{P - S}{\text{Present Value of Annuity Factor for N Years}}

  **Where:**

  * P = \text{Cost of the asset, including installation expenses.}
  * S = \text{Salvage value at the end of the asset’s useful life.}
  * D_n = \text{Depreciation charge for the nth year.}
  * N = \text{Useful life of the asset (in years).}
* **Present Value of Annuity Factor:**

  \
  \text{Present Value of Annuity Factor} = \frac{1 - (1 + r)^{-N}}{r}

  **Where:**

  * r = \text{Interest rate per period (usually annual).}
  * N = \text{Useful life of the asset (in years).}
* **Book Value after n Years (Bn):**

  \
  B_n = P - (D_1 + D_2 + ... + D_n)

  **Where:**

  * B_n = \text{Book value of the asset after n years.}
  * D_1, D_2, ..., D_n = \text{Depreciation charges for each year.}

***

### 6. Taxation System in Nepal

In Nepal, the taxation system significantly impacts engineering economics, particularly in project financial evaluations. Taxes affect the net cash flows, project costs, and pricing strategies, influencing the decision-making process for businesses and project managers. Below is a detailed breakdown of the main taxes that influence the financial landscape of projects:

**1. Net Income**

**Net Income** is the amount of money a company has left after subtracting all its expenses, taxes, interest, and depreciation from its total revenue. It represents the company's profitability during a given period.

Certainly! Here's the financial structure in a table format:

| **Item**                      | **Description**                                                | **Formula**                                                       |
| ----------------------------- | -------------------------------------------------------------- | ----------------------------------------------------------------- |
| **Revenue**                   | Total income from sales and services.                          | -                                                                 |
| **Cost of Goods Sold (COGS)** | Direct costs associated with the production of goods sold.     | -                                                                 |
| **Gross Profit**              | Revenue minus the cost of goods sold.                          | Gross Profit = Revenue - COGS                                     |
| **Operating Expenses**        | Costs associated with running the business, excluding COGS.    | -                                                                 |
| **Depreciation**              | Allocation of the cost of fixed assets over their useful life. | -                                                                 |
| **Taxable Income**            | Gross Profit minus Operating Expenses and Depreciation.        | Taxable Income = Gross Profit - Operating Expenses - Depreciation |
| **Income Tax**                | Tax rate applied to taxable income.                            | Income Tax = Tax rate × Taxable Income                            |
| **Net Income**                | Taxable Income minus Income Tax.                               | Net Income = Taxable Income - Income Tax                          |
| **Cash Flow**                 | Net income adjusted for depreciation.                          | Cash Flow = Net Income + Depreciation                             |

This table summarizes the income statement flow, from revenue through to the calculation of cash flow.

***

Example of Net Income

| **Item**                      | **Amount ($)** |
| ----------------------------- | -------------- |
| **Total Revenue**             | 100,000        |
| **Cost of Goods Sold (COGS)** | (20,000)       |
| **Gross Profit**              | 80,000         |
| **Operating Expenses**        |                |
| - Salaries                    | (10,000)       |
| - Rent                        | (10,000)       |
| - Utilities                   | (5,000)        |
| - Depreciation                | (5,000)        |
| **Total Operating Expenses**  | (30,000)       |
| **Taxes**                     | (10,000)       |
| **Net Profit**                | 30,000         |

**Calculation Steps:**

1. **Gross Profit** = Total Revenue - COGS = 100,000 - 20,000 = 80,000
2. **Total Operating Expenses** = Salaries + Rent + Utilities + Depreciation = 10,000 + 10,000 + 5,000 + 5,000 = 30,000
3. **Net Profit** = Gross Profit - Total Operating Expenses - Taxes = 80,000 - 30,000 - 10,000 = 30,000

***

**2. Corporate Income Tax**

Corporate income tax is levied on the earnings of businesses operating in Nepal. Companies are required to pay a certain percentage of their profits as tax. The rates for corporate income tax may vary based on factors such as:

* **Company size**: Larger corporations may face different tax rates compared to small and medium enterprises (SMEs).
* **Nature of the business**: Certain types of businesses, such as banks or insurance companies, may be taxed differently compared to manufacturing or service industries.

This tax directly affects the profitability of a project, as businesses must account for tax liabilities when calculating their overall income and project costs.

**3. Value Added Tax (VAT)**

Value Added Tax (VAT) is a consumption tax imposed on the sale of goods and services. In Nepal, VAT is applicable to most products and services, and it affects both businesses and consumers. For project-based activities, VAT impacts:

* **Costs**: VAT paid on purchases (e.g., raw materials, services, etc.) can be reclaimed if the business is VAT-registered. However, this affects the cash flow since the company must initially pay the VAT before reclaiming it.
* **Pricing strategies**: Projects that involve the sale of goods or services must factor in VAT when determining their pricing structure. The inclusion of VAT in the project’s cost structure may affect its overall profitability and financial planning.

Example:

* The company purchases raw materials worth NPR 100,000 with a VAT of 13% (NPR 13,000).
* The total payment made upfront is NPR 113,000 (NPR 100,000 for raw materials + NPR 13,000 for VAT).
* If the business sells its finished product for NPR 200,000 and charges VAT of 13% (NPR 26,000), it will collect VAT on its sales.
* The business can then **reclaim** the NPR 13,000 VAT it paid on raw materials (input VAT) from the NPR 26,000 VAT it collected from the customer (output VAT).
* The net VAT the company must remit to the tax authorities will be NPR 13,000 (NPR 26,000 collected - NPR 13,000 paid).

**Cash Flow Impact:**

* Even though the VAT can be reclaimed, the company has to **pay the VAT upfront** when making the purchase. This means the business initially has to **spend extra cash** (the VAT amount), which affects its **cash flow** until the VAT is refunded or offset against future sales.
* Where if the second transaction is smaller (selling for NPR 50,000 with a VAT of NPR 6,500), the business can reclaim the **input VAT** (NPR 13,000) up to the **output VAT** it collects (NPR 6,500).
* The business can reclaim this carried-forward VAT against future sales where it collects more output VAT.
* If the business cannot offset the remaining **NPR 6,500** input VAT against future sales, it can apply for a **VAT refund**.
* This typically happens when:
  * The business stops operations or completes its current cycle.
  * Input VAT exceeds output VAT due to circumstances like lower sales or no sales at all.
* The refund process usually involves:
  1. Filing a VAT return showing the excess input VAT.
  2. Submitting the necessary supporting documents, such as purchase invoices and sales records.
  3. Awaiting verification and approval from the tax authorities.

**4. Tax Incentives**

In order to encourage investment in specific sectors, the government of Nepal offers various **tax incentives** and deductions. These incentives are particularly targeted at industries that are crucial for the nation’s economic development, such as:

* **Infrastructure**: Projects related to roads, bridges, public utilities, and other infrastructure developments may be eligible for tax reductions or exemptions to incentivize investment.
* **Manufacturing**: To promote industrial growth, manufacturing companies may receive tax holidays or reduced tax rates for a specific period.

These tax incentives reduce the financial burden on businesses, making it easier to undertake large-scale projects in these sectors. When evaluating projects in such industries, understanding available tax incentives is crucial for accurately calculating the project’s net cash flow and return on investment.

**Importance of Understanding the Taxation System**

Understanding the taxation system in Nepal is essential for making informed financial decisions in project planning. By considering the impact of corporate income tax, VAT, and available tax incentives, project managers can:

* **Accurately forecast net cash flow**: Taxes influence both inflows (e.g., revenue generation) and outflows (e.g., costs), so it’s important to account for them when calculating projected profits and cash flows.
* **Adjust pricing strategies**: For businesses involved in the sale of goods or services, VAT and other taxes can affect the final price. Thus, understanding the tax landscape helps in setting competitive yet profitable pricing.
* **Evaluate project viability**: By accounting for taxes and incentives, businesses can better evaluate the financial feasibility of projects, ensure profitability, and minimize tax liabilities.

Here is the table with income tax slab for the resident of Nepal.



![Diagram Schematic](https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-c2362de4f472cdc17f6a27a9156b48a77a8ddcfb%2F10.2_taxation.png?alt=media)



Source:

{% file src="/files/jhPaaVUsR1yGf6iFbQm7" %}
Tax-slab-2081/82
{% endfile %}

In conclusion, taxes play a key role in determining the financial outcome of projects in Nepal. A comprehensive understanding of the tax system ensures that all financial aspects are properly accounted for and helps businesses optimize their operations and investments.

***

### **Conclusion**

Engineering economics helps in making informed decisions by providing quantitative methods to evaluate the financial viability of projects. By considering cash flow, the time value of money, and applying methodologies like NPV, IRR, and the discounted payback period, engineers can assess the profitability of projects. Additionally, understanding depreciation systems and taxation is crucial in optimizing the financial outcomes of projects, especially in specific regions like Nepal.

---

## 10.3 Project Planning and Scheduling

***

Project planning and scheduling are essential elements in managing a project effectively. They ensure that a project is completed on time, within budget, and meets the desired objectives. This section covers various aspects of project planning, including project classifications, project life cycle phases, planning processes, scheduling techniques, and monitoring.

### 1. Project Classifications

Projects can be classified in various ways, based on their duration, complexity, industry and scope. Some common classifications are:

* **Based on Complexity**:
  * **Simple Projects**: Projects with a low degree of complexity, usually having few interdependencies and stakeholders.
  * **Complex Projects**: Projects involving multiple components, stakeholders, and processes, requiring more detailed planning and coordination.
* **Based on Duration**:
  * **Short-term Projects**: Projects with a duration of less than one year.
  * **Long-term Projects**: Projects that span several years, often with stages or phases over time.
* **Based on Industry**:
  * **Construction Projects**: Projects related to the building and infrastructure industry.
  * **IT Projects**: Software development, system upgrades, or implementation projects.
  * **Manufacturing Projects**: Projects focused on the production of goods or services.
* **Based on Scope**:
  * **Internal Projects**: Projects conducted within an organization.
  * **External Projects**: Projects performed for clients or external stakeholders.

***

### 2. Project Life Cycle Phases

The **project life cycle** refers to the stages a project goes through from initiation to completion. Each phase has specific activities and milestones. The typical phases in the project life cycle are:

1. **Initiation Phase**:
   * Identifying the project's objectives, scope, and stakeholders.
   * Feasibility study and securing approval or funding.
2. **Planning Phase**:
   * Defining the project's detailed plan, including scope, goals, timeline, budget, and resources.
   * Risk management, quality control, and communication plans are developed.
3. **Execution Phase**:
   * Actual implementation of the project plan.
   * Coordination of resources, teams, and tasks.
   * Ensuring quality control and adherence to timelines.
4. **Monitoring and Controlling Phase**:
   * Continuous tracking of project progress to ensure it aligns with the plan.
   * Managing changes, risks, and issues as they arise.
   * Adjustments and corrective actions are made to stay on course.
5. **Closure Phase**:
   * Finalizing all project activities, closing contracts, and releasing resources.
   * Completing project deliverables and obtaining client or stakeholder sign-off.
   * Evaluating project performance, documenting lessons learned, and archiving project records.

***

### 3. Project Planning Process

The **project planning process** involves outlining the steps needed to achieve the project's objectives. It includes:

* **Defining the Scope**: Clarifying the work required and the project's deliverables.
* **Setting Objectives**: Establishing clear and measurable goals for the project.
* **Resource Planning**: Identifying the resources (personnel, equipment, materials) needed for each task.
* **Budgeting**: Estimating the costs associated with each phase of the project.
* **Risk Planning**: Identifying potential risks and developing mitigation strategies.
* **Time Planning**: Determining the timeline, including milestones and deadlines.
* **Quality Planning**: Ensuring that the project's outputs meet the required standards and expectations.
* **Communication Planning**: Establishing how information will be shared among team members, stakeholders, and clients.

***

### 4. Project Scheduling Techniques

**Project scheduling** involves determining the timeline and sequence of project tasks. The goal is to ensure that all project activities are completed on time. Common scheduling techniques include:

1. **Bar Chart (Gantt Chart)**

A **Gantt chart** is a visual representation of a project schedule, where tasks are shown along a timeline. It helps track progress, allocate resources, and adjust timelines.

* **Advantages**: Simple, easy to understand, visually intuitive.
* **Limitations**: Can be less effective for complex projects with many dependencies.

***

2. **Critical Path Method (CPM)**

**Critical Path Method (CPM)** is used to determine the longest sequence of tasks (critical path) that must be completed on time to ensure the project finishes as scheduled. It helps identify the minimum project duration and highlights which tasks must be prioritized.

* **Steps**:
  1. List all project tasks.
  2. Estimate the duration of each task.
  3. Identify task dependencies (which tasks must be completed before others).
  4. Calculate the critical path by determining which tasks affect the project’s duration the most.
* **Critical Path**: The sequence of tasks that determines the project’s overall duration.
* **Example:**

  Provided Activities:

  | **Activity** | **Immediate Predecessors** | **Duration (days)** |
  | ------------ | -------------------------- | ------------------- |
  | F            | -                          | 6                   |
  | G            | F                          | 4                   |
  | H            | F                          | 5                   |
  | I            | G, H                       | 3                   |
  | J            | G, I                       | 7                   |
* **Steps to Determine the Critical Path**

  **Activity F (No Predecessors)**

  * **Earliest Start (ES):** 0
    * **Earliest Finish (EF):** `0 + 6 = 6`

  **Activity G (Dependent on F)**

  * **ES:** `6` (F's EF)
  * **EF:** `6 + 4 = 10`

  **Activity H (Dependent on F)**

  * **ES:** `6` (F's EF)
  * **EF:** `6 + 5 = 11`

  **Activity I (Dependent on G and H)**

  * **ES:** `max(10, 11) = 11` (Latest of G's EF or H's EF)
  * **EF:** `11 + 3 = 14`

  **Activity J (Dependent on G and I)**

  * **ES:** `max(10, 14) = 14` (Latest of G's EF or I's EF)
  * **EF:** `14 + 7 = 21`

  **Critical Path**

  The **critical path** is the sequence of activities with the longest duration, as it determines the overall project duration.

  The critical path is: **F → H → I → J**, with a total duration:\
  `6 + 5 + 3 + 7 = 21 days`.

***

3. **Program Evaluation and Review Technique (PERT)**

**PERT** is a project management tool used to analyze and represent the tasks involved in completing a project. Unlike **CPM**, **PERT** uses probabilistic time estimates (optimistic, pessimistic, and most likely) to calculate expected durations.

**Formula for expected time** ( t_e ):

* t_e = \frac{(t_o + 4 t_m + t_p)}{6}

Where:

* t_o \text{ = Optimistic time}
* t_m \text{ = Most likely time}
* t_p \text{ = Pessimistic time}

**Advantages**: Useful for projects with uncertain durations and complex dependencies.

**Limitations**: Requires accurate time estimation and can be time-consuming to develop.

***

### 5. Resource Levelling and Smoothing

**Resource levelling** and **smoothing** are techniques used to balance resource usage throughout the project to avoid over-allocation or under-utilization.

* **Resource Levelling**: Adjusts the schedule (even extending the project duration if needed) to ensure resources are not over-allocated. This may lead to extending the project duration.
  * **Goal**: Ensure that resources are used efficiently and that no resources are overloaded.
* **Resource Smoothing**: Adjusts the timing of tasks (within their available float/slack) to use resources more effectively without changing the overall project duration.
  * **Goal**: Even out the resource demand while maintaining the project’s timeline.

Neither **resource leveling** nor **resource smoothing** involves adding extra resources. Instead, both focus on optimizing the allocation of available resources to achieve balance or efficiency:

***

### 6. Monitoring, Evaluation, and Controlling

Once a project is underway, it is essential to **monitor** and **evaluate** progress to ensure it stays on track. The goal is to identify any deviations from the plan early and take corrective actions. Key aspects include:

* **Monitoring**: Continuously tracking the project’s performance in terms of scope, time, and cost.
  * Tools used: Gantt charts, progress reports, and software tools.
* **Evaluation**: Assessing the project's status and comparing actual performance against the plan.
  * Key performance indicators (KPIs) are used to evaluate the project's success.
* **Controlling**: Taking corrective actions when necessary to address any issues that arise during the project.
  * Example: If a task is behind schedule, resource allocation can be adjusted, or dependencies can be reevaluated.

***

### **Conclusion**

Project planning and scheduling are critical for delivering a project successfully. Properly classifying the project, defining the life cycle phases, and using effective scheduling tools like Gantt charts, CPM, and PERT ensure that the project progresses on time. Resource leveling and smoothing ensure that resources are utilized effectively. Monitoring and controlling throughout the project help maintain focus on the objectives and allow for adjustments when necessary.

---

## 10.4 Project Management

Effective project management is essential for the successful delivery of any project, especially in complex environments. This section covers key elements such as project information systems, risk analysis, project financing, tender processes, and contract management.

***

### 1. Project Information Systems

A **project information system (PIS)** is a system designed to collect, store, process, and disseminate project-related data. It helps manage the flow of information throughout the project life cycle and supports decision-making by providing real-time data.

* **Components of a PIS**:
  * **Data Collection**: Gathering data from various sources such as stakeholders, project teams, and external systems.
  * **Data Storage**: Ensuring that data is stored securely and is easily accessible when needed.
  * **Data Processing**: Analyzing and processing data to derive meaningful insights.
  * **Data Dissemination**: Distributing the right information to the right stakeholders at the right time.
* **Types of Project Information Systems**:
  * **Project Management Software**: Tools like Microsoft Project, Primavera, or Asana used for planning, scheduling, and tracking project tasks.
  * **Collaboration Tools**: Platforms such as Slack, Microsoft Teams, or Trello for team communication and file sharing.
  * **Financial Systems**: Software to track project budgets, costs, and financial performance.
* The **Objective of PMIS (Project Management Information System)** is to:
  * Centralize project data for easy access and management.
  * Improve communication and collaboration among stakeholders.
  * Track and monitor project performance against goals.
  * Facilitate informed decision-making with accurate data.
  * Manage and mitigate project risks effectively.
  * Optimize resource allocation and usage.
  * Ensure compliance with standards and quality control.
  * Support documentation, reporting, and auditing processes.
  * Evaluate project success for future improvement.

A robust project information system ensures that all team members and stakeholders are aligned with project goals and timelines.

***

### 2. Project Risk Analysis and Management

**Risk** is the possibility of an event or condition that may cause a negative impact on a project's objectives, such as cost, schedule, scope, or quality. It arises from uncertainty and can result in adverse effects if not managed or mitigated. Risks can be internal (e.g., resource shortages) or external (e.g., market changes).

* Source of Risk:
  * **Management Risks**: Inadequate planning, poor communication, or lack of leadership.
  * **Financial Risks**: Budget overruns, funding shortages, or financial market fluctuations.
  * **External Risks**: Changes in regulations, political instability, or natural disasters.
  * **Human Resource Risks**: Staff turnover, skill gaps, or team dynamics issues.
  * **Technical Risks**: Unforeseen challenges with technology, tools, or systems.
* **Risk Management Process**:
  * **Risk management** is crucial for anticipating potential problems that may arise during the project and planning how to address them. It involves the identification, assessment, and mitigation of risks.
  * **Risk Identification**: Identifying potential risks that could affect the project’s success. Common risks include budget overruns, schedule delays, technical challenges, and resource shortages.
  * **Risk Assessment**: Analyzing the likelihood and potential impact of each identified risk. Risks are often prioritized based on their severity.
* **Qualitative Analysis**: Assessing risks in subjective terms (e.g., low, medium, high).
* **Quantitative Analysis**: Assigning numerical values to the likelihood and impact of risks (e.g., a 30% chance of occurring with a cost impact of $10,000).
* **Risk Mitigation**: Developing strategies to minimize or eliminate risks. This might involve:
  * **Tolerate**: Accepting the risk without taking any action. This approach is often used when the risk is minimal or the cost of mitigating it is higher than the potential impact.
  * **Treat**: Implementing measures to reduce or control the risk. This involves putting actions in place to minimize the likelihood or impact of the risk occurring.
  * **Transfer**: Shifting the risk to another party, such as through insurance or outsourcing. This reduces the impact on the project or organization by making another party responsible for managing the risk.
  * **Terminate**: Eliminating the risk by avoiding the activity or situation that causes the risk. This may involve changing project plans or strategies to ensure the risk is no longer present.
* **Risk Monitoring and Control**: Continuously monitoring identified risks and emerging risks during the project to ensure that mitigation measures are effective and adjust strategies as needed.
  * **Tools for Risk Management**:
    * **Risk Matrix**: A chart used to assess and prioritize risks based on their likelihood and impact(severity).
    * **SWOT Analysis**: Identifying Strengths, Weaknesses, Opportunities, and Threats related to the project.
    * **Monte Carlo Simulation**: A computational algorithm used to assess the probability of different outcomes in uncertain environments.

***

### 3. Project Financing

**Project financing** refers to the methods used to fund a project, including obtaining capital, managing costs, and ensuring financial stability throughout the project life cycle.

* **Sources of Project Financing**:
  * **Equity Financing**: Raising funds through the sale of shares in the project or company.
  * **Debt Financing**: Borrowing money through loans, bonds, or other financial instruments.
  * **Grants and Subsidies**: Obtaining funds from government agencies or non-profit organizations, often for specific types of projects (e.g., research and development).
  * **Overdrafts**: Short-term borrowing facility provided by banks, allowing businesses to withdraw more money than is available in their account.
  * **Sales and Leaseback**: Selling an asset and leasing it back from the buyer, providing liquidity while retaining the use of the asset.
  * **Debentures**: Long-term debt instruments issued by a company, usually unsecured, to raise capital from investors.
  * **Public-Private Partnerships (PPP)**: Collaboration between government and private companies to fund large infrastructure projects.
  * **Retained Profits**: Using the company's own accumulated profits for reinvestment into projects or expansion.
  * **Venture Capital**: Funding provided by investors to startups or small businesses with high growth potential, often in exchange for equity.
  * **Business Angels**: Wealthy individuals who provide capital to startups or early-stage companies in exchange for equity or debt.
* **Financing Methods**:
  * **Project Budgeting**: Estimating the total cost of the project, breaking it down into phases and tasks.
  * **Cost Tracking and Control**: Monitoring spending throughout the project and making adjustments to ensure the project stays within budget.
  * **Cash Flow Management**: Ensuring that the project has enough liquidity to pay for ongoing expenses.
  * **Financial Risk Management**: Identifying and mitigating financial risks such as currency fluctuations, interest rate changes, or credit risks.
* **Capital Budgeting Decision:**
  * Capital budgeting decisions refer to the process of evaluating and selecting long-term investment projects or expenditures that will affect the financial future of an organization. These decisions are crucial because they involve substantial financial commitments and can impact the company's growth and profitability.
  * Key Points of Capital Budgeting Decisions:
    1. **Investment Appraisal**: Evaluating potential investments by analyzing the expected costs and returns over time.
    2. **Techniques Used in Capital Budgeting**:
       * **Net Present Value (NPV)**: The difference between the present value of cash inflows and outflows over the investment's life.
       * **Internal Rate of Return (IRR)**: The discount rate that makes the NPV of an investment equal to zero, representing the project's rate of return.
       * **Payback Period**: The time it takes for an investment to recover its initial cost from its cash inflows.
       * **Profitability Index (PI)**: The ratio of the present value of cash inflows to the initial investment.
       * **Discounted Payback Period**: A variation of the payback period that accounts for the time value of money.
    3. **Risk Consideration**: Identifying and assessing risks associated with the investment, including market, financial, and operational risks.
    4. **Long-Term Impact**: Capital budgeting decisions often involve projects that will affect a company for several years, requiring careful analysis of future cash flows, profitability, and strategic alignment.
    5. **Resource Allocation**: Ensuring the best use of limited financial resources by prioritizing projects with the highest potential returns and alignment with organizational goals.

***

### 4. Procurement

Procurement refers to the process of acquiring goods, services, or works from external sources through various methods and procedures, usually involving competitive bidding. It is a critical aspect of project management and is aimed at ensuring that the required resources are obtained in a cost-effective, timely, and transparent manner.

* Method of Work Execution in Public Procurement

  In public procurement, different methods are applied based on the nature, urgency, and size of the required goods, services, or works. Below are the commonly used methods:

  * **Direct Procurement**
    * **Description:**\
      This method allows the procurement of goods, services, or works directly from contractors who are already on the entity's standing list. It bypasses the need for competitive bidding, simplifying the process and saving time.
      * **Limits:**
        * Goods and Works: Up to Rs. 10 lakh.
        * Consulting Services: Up to Rs. 5 lakh.
      * **When to Use:**\
        Suitable for smaller procurements or when time constraints prevent a formal bidding process.
  * **Sealed Quotation**
    * **Description:**\
      This method involves inviting sealed quotations from interested suppliers or contractors for goods, services, or works. It is typically used for relatively smaller procurements. Suppliers submit their quotations in sealed envelopes, ensuring confidentiality until the opening stage.
      * **Limit:**\
        Up to Rs. 20 lakh.
      * **Process:**
        * A notice for the sealed quotation must be published in a national newspaper.
        * The notice period is at least 15 days, allowing sufficient time for suppliers to prepare their bids.
      * **When to Use:**\
        Appropriate for situations requiring multiple quotes but where formal tendering is not needed.
  * **National Competitive Bidding**
    * **Description:**\
      This method is used for larger procurement needs, typically for projects valued between Rs. 20 lakh and Rs. 5 billion. It includes various tendering approaches such as shopping, buy-back, limited tendering, and lump sum methods.
      * **Limit:**\
        Rs. 20 lakh to Rs. 5 billion.
      * **Process:**
        * A notice must be published in a national newspaper to invite bids.
        * A notice period of at least 30 days is required, ensuring enough time for potential bidders to respond.
      * **When to Use:**\
        Suitable for medium to large projects where multiple suppliers are needed to encourage competition.
  * **International Competitive Bidding**
    * **Description:**\
      This method is typically used for large-scale projects with a value above Rs. 5 billion, ensuring global competition and the best value for the project. It invites international suppliers or contractors to bid, increasing the pool of potential candidates.
      * **Limit:**\
        Above Rs. 5 billion.
      * **Process:**
        * For projects with an estimated value between Rs. 5 billion and Rs. 10 billion, at least 25% of the work must be undertaken by domestic contractors to promote local involvement.
        * A 5% domestic preference is provided, meaning if a domestic contractor is part of a joint venture, the contract can be awarded to that joint venture even if their bid exceeds the lowest bid by 5%.
        * The notice for international bidding must be published in both national and international English newspapers.
        * A notice period of at least 45 days is required to ensure transparency and ample time for international competitors to submit their bids.
      * **When to Use:**\
        This method is suitable for very large, high-value projects requiring international expertise and competition.
  * **Work through User's Committee**\
    A committee formed by the users or beneficiaries of the goods/services to handle procurement, ensuring their needs are met directly.
    * **Cost Estimate Limit:**
      * Up to Rs. 5 crore may be carried out or obtained from a user's committee.
        * Rs. 5 crore for co-operatives.
        * Rs. 1 crore for normal user's committees.
        * **Scope of Work:**\
          This method is typically used for labor-intensive works. Projects that involve heavy equipment or require large machinery are excluded from being carried out through the user's committee. Only works that can be managed with manual labor are eligible under this procedure.
        * **When to Use:**
          * Suitable for projects with lower budgets and those that do not require specialized equipment.
          * Can be used for community-based, smaller-scale development works or projects involving local groups like co-operatives or community committees.
  * **Emergency Procurement**\
    Used for immediate procurement in unforeseen emergency situations, such as natural disasters or urgent requirements.
  * **Nongovernmental Organization (NGO)**\
    NGOs are involved in procurement activities, typically in development and humanitarian projects, with rules suited for their specific needs.
  * **Force Account**\
    Involves using the organization's own resources and labor to execute works, often used for small or specialized projects.
  * **Sealed Quotation**\
    A competitive bidding process where quotations are submitted in sealed envelopes, typically used for smaller procurement needs.
  * **National Bid**\
    Competitive bidding open only to national suppliers or contractors, often used for local projects or where only national expertise is required.
  * **International Bid**\
    Open competitive bidding involving international suppliers, typically for large-scale projects or those requiring expertise or resources not available domestically.
  * **Catalogue Shopping**\
    Procurement done by selecting goods or services from pre-approved catalogs, often used for fixed-price items.
  * **Buy Back Method**\
    A procurement method where the contractor or supplier is required to buy back existing equipment, products, or services as part of the deal.
  * **Limited Tendering**\
    A competitive bidding process where only selected, qualified suppliers are invited to submit tenders, ensuring specific expertise or quality.
  * **Lump Sum Method**\
    A method where a fixed price is agreed upon for completing a specified scope of work, commonly used in construction and large projects.
* **PPMO (Public Procurement Monitoring Office)**

  The Public Procurement Monitoring Office (PPMO) is an important governmental body responsible for overseeing public procurement activities in Nepal. Its key functions include ensuring transparency, accountability, and efficiency in the procurement process, as well as monitoring and evaluating procurement procedures to comply with relevant laws and regulations.

  * Key Roles and Responsibilities of PPMO:
    * **Monitoring and Oversight:**\
      PPMO monitors the public procurement process, ensuring that it adheres to legal and regulatory requirements.
    * **Regulation Enforcement:**\
      Enforces rules and policies related to public procurement and ensures that procurement is conducted fairly, transparently, and with due diligence.
    * **Capacity Building:**\
      Provides training, guidelines, and support to government entities and procurement professionals to improve procurement practices.
    * **Complaint Handling:**\
      Handles complaints and grievances related to procurement processes and resolves disputes when necessary.
    * **Audit and Evaluation:**\
      Conducts audits and evaluates procurement projects to ensure that they meet the set standards and provide value for money.
    * **Research and Reporting:**\
      Conducts research on procurement trends and challenges and publishes reports to inform and guide future procurement activities.

PPMO's primary goal is to streamline public procurement in Nepal to prevent corruption, inefficiency, and delays while ensuring that public funds are spent effectively.

***

### 5. Tendering Process

**Tendering** is the formal process of inviting and evaluating bids from suppliers or contractors to provide goods, services, or labor for the project. The tendering process ensures transparency, competitiveness, and fairness in project procurement.

**Tendering comes into play during the procurement process when an organization needs to acquire goods, services, or works through a competitive process** (e.g., National Competitive Bidding, International Competitive Bidding, or sealed quotations).

Procurement can include tendering as one of the methods for sourcing, but **procurement can also occur without formal tendering** in cases of direct purchase or when the total value of the goods or services is low.

* **Tendering Process Steps**:
  1. **Preparation of Tender Documents**: Detailed documents outlining the project requirements, terms, conditions, and selection criteria.
  2. **Invitation to Tender (ITT)**: Issuing the invitation to potential suppliers or contractors to submit bids for the project.
  3. **Bid Submission**: Interested suppliers submit their proposals, including technical specifications, pricing, and timelines.
     1. Rs 3000 voucher for the project having budget i.e. under 2 crores
     2. Rs 5000 voucher for the project having budget i.e. over 2 crores
  4. **Bid Evaluation**: Reviewing and comparing the bids based on criteria such as cost, technical capability, experience, and compliance with project requirements.
  5. **Contract Award(Letter of Intent)**: Selecting the winning bid and awarding the contract to the chosen supplier or contractor.
  6. **Contract Negotiation**: Finalizing terms and conditions, and ensuring both parties are aligned on expectations.
* **Types of Tenders**:
  * **Open Tendering**: Any qualified contractor can submit a bid.
  * **Selective Tendering**: Only selected contractors are invited to bid.
  * **Negotiated Tendering**: Direct negotiations with a contractor, often used when only one party is capable of completing the work.
* Details of Tender Notice:

  A **tender notice** typically includes the following details in short:

  1. **Name of the authority publishing the notice**: The organization or entity inviting bids.
  2. **First date of publication**: The date when the tender notice is first published.
  3. **Brief description of the job**: A summary of the work or services to be performed under the contract.
  4. **Date, time, and place for tender document availability and submission**: When and where the tender documents can be obtained and submitted.
  5. **Cost of the tender document**: The price required to purchase the tender documents.
  6. **Cost estimate** (optional for works under 2 crore): The estimated cost of the project or work.
  7. **Date, time, and place of bid opening**: When and where the bids will be opened.
  8. **Earnest money and security deposit amount**: The required financial guarantee (earnest money) and the performance security deposit amount.
  9. **Expected date of acceptance of successful bids**: The anticipated date when the contract award decision will be made.
* Bid Security & Its Validity
  * The **bid security** (the amount required from bidders to guarantee their participation in the tender process) for projects with an estimated cost **up to 2 Crores** should be **2-3%** of the estimated project cost.
  * **NCB**: Bid document validity = **90 days**, Bid security validity = **120 days**.
  * **ICB**: Bid document validity = **120 days**, Bid security validity = **150 days**.
* Performance Security
  * The **performance security** is a financial guarantee required from the winning bidder to ensure that they will fulfill the terms of the contract if awarded. The value of the performance security is calculated based on the **bid price** and the **cost estimate**.
  * **If the bid amount is within 85% of the cost estimate**:

    **Performance Security = 5% of Bid Amount**

    This means if the bid amount is at or below 85% of the cost estimate, then the performance security will be 5% of the actual bid price.
  * **If the bid amount is above 85% of the cost estimate**:

    * **Performance Security = 5% of Bid Price + (0.85 \* Cost Estimate) \* 0.5**

    This means if the bid amount exceeds 85% of the cost estimate, the performance security will be a combination of:

    * 5% of the actual bid price
    * An additional calculation: 0.85 of the cost estimate, multiplied by 0.5.



![Invitation for Bids](https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-1ab01be8a792f08fe73450631555b305fa019a75%2F10.4_invitation_for_bid.png?alt=media)





![Letter of Intent](https://3333194153-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FgqhQ5rzaUIaiagSOnjNG%2Fuploads%2Fgit-blob-f0994c702a2624969785b11d1d7af303acdea9fb%2F10.4_letter_of_intent.png?alt=media)



***

### 6. Contract Management

* A **contract** is defined as an agreement concluded between two or more parties for performing or not performing any work. It is legally binding and enforceable.
  * **Elements of a Contract**:
    * **Two or more competent parties**: All parties involved must be legally capable of entering into the contract.
    * **Offer and acceptance**: One party makes an offer, and the other party accepts it.
    * **Intention of creating legal relations**: Both parties must intend to be legally bound by the contract.
    * **Free consent**: The agreement must be made voluntarily, without coercion, undue influence, or misrepresentation.
    * **Lawful purpose**: The objective of the contract must be legal.
    * **Possibility of performance**: The terms of the contract must be capable of being performed.
    * **Written and registration**: In certain cases, the contract must be written and registered to be valid (e.g., property transactions).

***

* **Contract management** involves overseeing and managing all aspects of the contract between the project team and the supplier, contractor, or client. It ensures that the contract is executed as agreed upon and resolves any issues that arise during the project.
  * **Key Steps in Contract Management**:
    1. **Contract Formation**: The creation of a legally binding agreement that outlines the roles, responsibilities, terms, and conditions of all parties involved.
    2. **Contract Execution**: Managing the performance of the contract by ensuring that both parties meet their obligations.
    3. **Change Management**: Handling any modifications or amendments to the contract, often due to unforeseen circumstances or scope changes.
    4. **Dispute Resolution**: Addressing conflicts between parties, whether through negotiation, mediation, or legal action.
    5. **Contract Closure**: Finalizing the contract after the project is completed, ensuring all terms and conditions are met, and that all deliverables are accepted.

***

* **Types of Contracts**:
  * **Fixed-Price Contracts**: The price is agreed upon upfront and remains the same throughout the contract.
  * **Cost-Plus Contracts**: The client reimburses(repay) the contractor for actual costs plus an additional fee.
  * **Time and Materials Contracts**: Payment is based on the actual time spent and materials used.
  * **Incentive Contracts**: Contractors are rewarded for completing the project ahead of schedule or under budget.

***

* **Pre-Qualification & Post-Qualification**
  * **Pre-qualification** is a process used to shortlist eligible bidders before the bidding process, ensuring only competent contractors participate, thus avoiding overcrowding.

    **Key Criteria for Pre-Qualification:**

    * **Experience**: Past performance on similar contracts.
      * **Capabilities**: Availability of skilled personnel, equipment, and facilities for construction or manufacturing.
      * **Financial Position**: Financial stability and capacity of the bidder.
      * **Litigation History**: A review of the bidder’s history in legal disputes.
      * **Note:** Pre-qualification is **not required** for projects with an estimated cost below **Rs. 20 million (Rs. 2 crore)**.
  * Post-qualification allows all eligible bidders to participate in the bidding process. It may involve:
    * **Single Envelope System**: Includes only the financial proposal.
    * **Double Envelope System**: Includes both the financial and technical proposals in separate envelopes.
    * **Technical Shortlist**:
      * Shortlist bidders based on technical proposals.
      * Award the contract to the lowest bidder among those shortlisted.\
        \&#xNAN;*(This is the most common method in Nepal.)*
    * **Lowest Bidder First**:
      * Evaluate the lowest financial bid.
      * If the technical proposal is satisfactory, award the contract.
      * If not, evaluate the next lowest bidder's technical proposal.
    * **Weighted Evaluation**:
      * Assign weights to both financial and technical proposals.
      * Award the contract to the bidder with the highest overall score.
      * Here also if the Project Budget is under 2 crores, then there is no Pre-Qualification process happen.

***

### **Conclusion**

Project management encompasses a wide range of activities and skills necessary for the successful completion of a project. The effective use of **project information systems**, thorough **risk analysis**, proper **project financing**, careful handling of the **tendering process**, and strong **contract management** are essential for ensuring that a project is completed on time, within budget, and to the satisfaction of stakeholders. Managing these aspects effectively contributes to the overall success and sustainability of the project.

---

## 10.5 Engineering Professional Practice

Engineering practice is not just about technical skills; it involves understanding and responding to the broader impacts of engineering work on society, the environment, and the profession itself. This section covers key aspects of professional practice, including ethical considerations, regulatory requirements, and the role of professional associations like the Nepal Engineers Association (NEA).

***

### 1. Environment and Society

Engineers must recognize the impact of their work on both the environment and society. This includes ensuring that projects are sustainable and contribute positively to the community.

* **Environmental Considerations**: Engineers are responsible for designing systems, products, and processes that minimize environmental harm. This includes reducing waste, conserving energy, and using sustainable materials.
  * **Sustainability**: Creating designs that balance economic, environmental, and social factors.
  * **Life-Cycle Assessment (LCA)**: Evaluating the environmental impact of a product or system throughout its entire life, from raw material extraction to disposal.
* **Social Responsibility**: Engineers must consider the social implications of their projects. This involves ensuring public safety, improving quality of life, and contributing to the well-being of the community.
  * **Public Welfare**: Ensuring that engineering practices prioritize safety, public health, and the quality of life.
  * **Inclusion and Accessibility**: Designing systems and structures that are accessible to all, including vulnerable groups in society.

***

### 2. Professional Ethics

Professional ethics in engineering ensures that engineers uphold high standards of integrity, accountability, and responsibility.

* **Ethical Principles**:
  * **Honesty**: Providing truthful and accurate information in all aspects of work.
  * **Integrity**: Avoiding conflicts of interest, ensuring fairness and transparency in all decisions.
  * **Accountability**: Taking responsibility for the outcomes of one's work and decisions.
  * **Confidentiality**: Protecting sensitive information, including client details and proprietary data.
  * **Fairness**: Ensuring equal treatment of all stakeholders, including clients, colleagues, and the public.
* **Codes of Ethics**: Many professional bodies, including the **Nepal Engineers Association (NEA)**, establish codes of ethics to guide members' conduct. These codes provide frameworks for resolving ethical dilemmas in professional practice.

***

### 3. Regulatory Environment

Engineers must comply with laws, regulations, and standards that govern their practice. These rules ensure that engineering work is carried out safely and responsibly, considering the welfare of society.

* **National and International Standards**: Engineers are expected to adhere to industry standards such as those established by the **Nepal Bureau of Standards and Metrology (NBSM)** and international organizations like **ISO**.
* **Regulatory Compliance**: In Nepal, engineers must follow specific regulations related to construction, environmental protection, and public safety. This may include obtaining permits, adhering to building codes, and ensuring compliance with safety regulations.
* **Government Agencies**: Engineers work closely with government bodies, such as the **Department of Roads (DoR)** and the **Ministry of Urban Development**, to ensure that projects comply with national policies and regulations.

***

### 4. Contemporary Issues and Problems in Engineering

The engineering field faces numerous contemporary challenges that engineers must address through innovative solutions.

* **Climate Change and Sustainability**: Engineers are at the forefront of developing technologies and practices to mitigate climate change, such as renewable energy systems, energy-efficient building designs, and sustainable waste management solutions.
* **Technological Advancements**: Rapid developments in fields such as AI, robotics, and automation present new challenges and opportunities. Engineers must adapt to these changes while ensuring ethical practices and minimizing potential negative impacts.
* **Urbanization**: With increasing urban populations, engineers play a critical role in designing infrastructure that can accommodate growing cities. This includes transportation systems, housing, sanitation, and energy provision.
* **Cybersecurity**: As digital systems and automation become more integrated into engineering projects, protecting these systems from cyber threats becomes increasingly important.
* **Globalization**: Engineers must navigate the complexities of working in a globalized world, where projects may involve cross-cultural collaboration, diverse regulatory environments, and international standards.

***

### 5. Occupational Health and Safety (OHS)

Ensuring the health and safety of workers and the public is a primary responsibility for engineers. Effective occupational health and safety practices are essential in preventing accidents, injuries, and fatalities.

* **Safety Standards**: Engineers must adhere to safety standards set by national and international organizations, such as the **Occupational Safety and Health Administration (OSHA)**.
* **Risk Assessment and Mitigation**: Engineers are responsible for assessing risks associated with their projects, implementing safety measures, and ensuring that workers are trained to handle potential hazards.
* **Workplace Safety Programs**: Implementing safety programs, ensuring regular safety audits, and providing personal protective equipment (PPE) are key components of an effective OHS system.
* **Health Considerations**: Engineers must also consider the long-term health impacts of their work, especially in industries such as construction, chemicals, and manufacturing, where exposure to hazardous substances can lead to chronic conditions.

***

### 6. Role and Responsibilities of the Nepal Engineers Association (NEA)

The **Nepal Engineers Association (NEA)** plays a pivotal role in representing and regulating the engineering profession in Nepal. It ensures that engineers meet the required standards and adhere to ethical and professional practices.

* **Advocacy and Representation**: NEA advocates for the interests of engineers and the profession in national policymaking. It ensures that engineering projects comply with local laws and standards.
* **Professional Development**: NEA provides continuous learning opportunities for engineers through seminars, workshops, and training programs. This helps engineers stay updated on new technologies, regulations, and ethical practices.
* **Certification and Licensing**: NEA is involved in certifying and licensing engineers in Nepal. It sets educational and experience requirements for engineers and ensures that only qualified professionals practice engineering.
* **Ethical Oversight**: NEA enforces a code of ethics and handles complaints against engineers who violate professional standards. It plays a key role in maintaining the integrity of the profession.
* **Public Awareness**: NEA works to raise public awareness about the importance of engineering in national development, including promoting sustainable practices and contributing to community welfare.

***

### **Conclusion**

The practice of engineering extends beyond technical proficiency; it requires an understanding of the societal, environmental, and ethical implications of one's work. Engineers are responsible for ensuring the safety, health, and well-being of individuals, communities, and the planet. Regulatory compliance, ethical conduct, and adherence to health and safety standards are essential aspects of professional practice. Additionally, associations like the Nepal Engineers Association (NEA) play a crucial role in supporting the professional development and ethical standards of engineers in Nepal, helping to guide the profession through contemporary challenges and ensuring a positive impact on society.

---

## 10.6 Engineering Regulatory Body

The **Nepal Engineering Council (NEC)** is the primary regulatory body overseeing the engineering profession in Nepal. Established under the **Nepal Engineering Council Act, 2055 (1999)**, its primary role is to regulate the engineering profession by certifying and licensing engineers, ensuring quality education, and promoting ethical and professional standards.

***

### 1. Overview of the Nepal Engineering Council (NEC)

* **Establishment**: The NEC was established in 2056 B.S. through the Nepal Engineering Council Act, with the goal of professionalizing and regulating engineering practices in Nepal.
* **Objective**: To maintain a high standard of engineering practice, ensure public safety, and support national development by regulating engineers and engineering education in Nepal.

***

### 2. Functions and Responsibilities of NEC

The NEC has several key responsibilities, which are outlined in the **Nepal Engineering Council Act, 2055**:

**a. Certification and Licensing of Engineers**

* **Registration**: The NEC is responsible for registering engineers who meet the qualifications prescribed by the council.
  * **Categories of Registration**:
    * Professional Engineer (P.Eng.): For individuals with advanced experience and qualifications.
    * General Engineer: For engineers with a recognized degree in engineering.
  * **Requirements for Registration**:
    * Recognized engineering degree from an accredited institution.
    * Payment of registration fees and submission of required documents.
* **Licensing**: Only registered engineers are legally allowed to practice engineering in Nepal. The council issues licenses and renews them periodically.

**b. Accreditation of Engineering Programs**

* NEC evaluates and accredits engineering programs offered by universities and colleges to ensure they meet national and international standards.

**c. Regulation of Engineering Practices**

* NEC enforces standards of professional conduct and practice to ensure the safety, health, and welfare of the public.
* It has the authority to investigate misconduct or unethical behavior by engineers and impose disciplinary actions if necessary.

**d. Development of Policies and Standards**

* NEC develops policies, codes of conduct, and technical standards to guide engineering practices in Nepal.

**e. Promotion of Professionalism**

* The council organizes workshops, seminars, and training programs to promote continuous professional development (CPD) among engineers.
* NEC encourages research and innovation in the engineering field.

**f. Dispute Resolution**

* NEC helps resolve disputes between engineers or between engineers and clients related to professional practice.

***

### 3. Nepal Engineering Council Act, 2055

The **Nepal Engineering Council Act, 2055** is the legislative framework that governs the NEC. Key highlights include:

* **Registration and Licensing**:
  * Engineers must be registered with the NEC to legally practice engineering in Nepal.
  * The council maintains a register of all licensed engineers and their areas of expertise.
* **Accreditation**:
  * NEC ensures that engineering education institutions meet the minimum standards for producing competent engineers.
* **Code of Ethics**:
  * The act emphasizes the importance of ethical practices, and the council enforces disciplinary measures for violations.
* **Disciplinary Actions**:
  * NEC has the authority to suspend or cancel the license of engineers found guilty of professional misconduct or unethical practices.

***

**Based on the above-mentioned paper, here is the summarization of some important topics.**

**Summary of NEC Act, 2055**

**Date of Publication:** 2055-11-27\
**Chapters:** 7\
**Sections:** 38

***

**Key Provisions**

**Council Structure**

* **Total Members:** 21
* **Tenure of Members:** 4 years

**Composition:**

1. **President:**
   * Qualification: Bachelor's degree + 15 years experience
   * Appointment: Nominated by Government of Nepal (GoN)
   * Count: 1
2. **Vice President:**
   * Qualification: Bachelor's degree + 10 years experience
   * Appointment: Nominated by GoN
   * Count: 1
3. **Members (7):**
   * Qualification: Bachelor's degree + 7 years experience
   * Representation: One from each province (at least three women)
   * Appointment: Nominated by GoN
4. **Members (5):**
   * Elected from Nepal Engineers’ Association (NEA)
5. **Member (1):**
   * President of NEA
6. **Member (1):**
   * Campus Chief of any engineering campus
   * Appointment: Nominated by GoN
7. **Member (1):**
   * Representative from Institute of Engineering, Tribhuvan University (T.U.)
   * Appointment: Nominated by GoN
8. **Member (1):**
   * Representative from universities teaching engineering in Nepal
   * Appointment: Nominated by GoN
9. **Members (2):**
   * Qualification: Bachelor's degree + 7 years experience (at least one woman)
   * Appointment: Nominated by the Council
10. **Member-Secretary (Registrar):**
    * Qualification: Bachelor's degree + 10 years experience

***

**Meeting Provisions**

* **Minimum Meetings:** 4 times per year
* **Quorum:** At least 50% of members present
* **Decision Authentication:** By Member-Secretary

***

**Membership Rules**

**Disqualification Criteria:**

1. Non-Nepalese citizenship
2. Bankruptcy leading to proportional division of property among creditors
3. Conviction under law
4. Mental disorder
5. Permanent Residency (PR) in a foreign country
6. Removal of name from the register for violations

***

**Registration of Engineers**

* **Exams for Registration:**
  * Conducted by the council, at least twice a year.
  * **Exam Committee:** 5 members (including at least one woman), with the Registrar as Member-Secretary.
* **Reasons for Removal from Register:**
  1. Violation of professional code of conduct (requires two-thirds majority in Council meeting).
  2. Fraudulent or erroneous registration.
  3. Disqualifying conditions (as mentioned above).

***

**Punishment for Unregistered Practice**

* Fine: Up to Rs. 10,000
* Imprisonment: Up to 3 months
* Both fine and imprisonment

***

**Academic and Institutional Oversight**

1. The council recognizes certificates of academic qualification in engineering.
2. Institutions must obtain council permission to teach any engineering subject.

***

**Autonomy and Governance**

* The council is an autonomous body.
* A new council must be constituted within three months of the dissolution of the previous council.
* The council communicates with the government through the Ministry of Physical Infrastructure and Transportation.
* The council holds authority to create rules and regulations (Section 37).

***

**Amendments**

* **First Amendment:** 2079-05-05 (First Amendment Bill, 2076)

This summary ensures clarity and conciseness for easy reference.

***

### 4. Nepal Engineering Council Regulations, 2057

The **Nepal Engineering Council Regulations** provide detailed guidelines for implementing the provisions of the NEC Act. These include:

* **Application Process for Registration**:
  * Engineers must submit an application with proof of their qualifications, including academic degrees and transcripts, to register with the NEC.
* **Fee Structure**:
  * The regulations outline the registration, licensing, and renewal fees for engineers.
* **Continuous Professional Development (CPD)**:
  * Engineers are required to participate in professional development activities to maintain their licenses.
* **Accreditation Criteria**:
  * The regulations specify the criteria for accrediting engineering programs in Nepal, including faculty qualifications, curriculum standards, and infrastructure.

***

**Summary of NEC Regulations, 2057**

**Date of Publication:** 2057-03-08\
**Chapters:** 7\
**Clauses:** 38\
**Established Under:** NEC Act, 2055 (Section 37)

**Amendments:**

* **First Amendment:** 2064 BS
* **Second Amendment:** 2069 BS
* **Third Amendment:** 2080 BS

***

**Key Provisions**

**Engineer Registration Categories**

**A. General Engineer:**

* **Qualification:** Minimum BE degree
* **Requirements:** Pass written exam conducted by the council
* **Registration Fee:** NPR 5,000 (+ NPR 200 for Identity Card)

**B. Professional Engineer (P.Eng):**

* **Qualification:** Master's degree + 7 years of experience as a General Engineer
* **Requirements:** Pass written exam, competency assessment, and interview conducted by the council
* **Registration Fee:** NPR 20,000
* **Validation Period:** 5 years
  * **Renewal Fee:** NPR 10,000 (apply 2 months before expiration)

**C. Foreign Engineer:**

* **Qualification:** Minimum BE degree + 10 years of experience
* **Registration Fee:** NPR 30,000
* **Validation Period:** 2 years
  * **Renewable:** 1 year on employer's request (same fee applies)

***

**Registration Maintenance**

* **Registration Records:** Maintained separately for General, Professional, and Foreign Engineers.
* **Language of Records:**
  * General and Professional Engineers: Nepali
  * Foreign Engineers: English
* **Updates and Publications:**
  * Annual publication of registered engineers' names.
  * Registered list updated every 4 years.
  * Foreign engineers excluded from the published list.

***

**Code of Conduct for Engineers**

1. Maintain discipline and honesty.
2. Exhibit politeness and ensure secrecy.
3. Avoid any form of discrimination.
4. Perform only professionally related work.
5. Refrain from actions harmful to the engineering profession.
6. Take personal responsibility for all work.
7. Include name, designation, and registration number on professional documents.
8. Avoid undue publicity or advertisement.

**Violation Examination:**

* A 3-member committee investigates complaints about code violations or ineligibility.
* Committee is coordinated by a council member.

***

**Financial Management**

* The council's bank account is jointly operated by:
  * **Signatories:** President/Registrar and Account Officer.

***

**Data on NEC**

* **Total Engineering Professions:** 59
* **Registered Engineers (2057-58 to 2078 Ashwin):** 64,620
* **Professional Engineers with P.Eng Title (as of 2078 Ashwin):** 61

**Recognized Universities:**

* **Total Recognized:** 810 (as of Nov. 2021)
* **Universities in Nepal Running Engineering Programs:** 7
  * Includes Manmohan Technical University as the 7th.
* **Countries with Recognized Universities:** 45

***

**Leadership History**

* **First Chairman:** Er. Ram Babu Sharma (2056-09-26 to 2060-09-25)
* **First Registrar:** Er. Bindeshwor Yadav (2056-09-23 to 2060-09-25)

This summary consolidates the key points of NEC Regulations, 2057, for easy reference and understanding.

***

**Roles and Importance of NEC in Engineering Regulation**

The NEC plays a critical role in regulating and standardizing engineering practices in Nepal. Some of its contributions include:

**a. Ensuring Public Safety**

* By regulating engineering practices, the NEC ensures that projects meet safety and quality standards to protect the public from potential hazards.

**b. Enhancing Professionalism**

* NEC’s code of ethics and licensing system encourage engineers to maintain high standards of professionalism and accountability.

**c. Supporting National Development**

* NEC ensures that engineers are equipped with the necessary skills and knowledge to contribute effectively to Nepal’s infrastructure and economic development.

**d. Maintaining International Standards**

* Through its accreditation and regulatory activities, NEC ensures that Nepalese engineering practices and education align with global standards.

**e. Resolving Legal and Ethical Issues**

* NEC helps resolve disputes and ensures that engineers adhere to ethical guidelines, fostering trust in the profession.

***

### 5. Engineering Program Approval Criteria for colleges in Nepal

**Bachelor Programs**

* **Temporary Approval:**
  * **New Institution:**
    * **Average Score Required:** 50% in all sections with an average 60%
    * **Regular Investigation:** Every 1 year
  * **Old Institution:**
    * **Average Score Required:** 60% in all sections with an average 70%
    * **Regular Investigation:** Every 1 year
* **Permanent Approval:**
  * **Average Score Required: 75% on some section with average 90%**
  * **Regular Investigation:** Every 2 years
  * Approval granted after completion of after 2 cycle of bachelor's degree completion with temporary approval.

**Master Programs**

* **Temporary Approval:**
  * **Average Score Required:** Average 60%(600 score)
  * **Regular Investigation:** Every 1 year
  * Approval granted after completion of after 1 cycle of bachelor's degree completion.
* **Permanent Approval:**
  * **Average Score Required:** Average 80%(800 score)
  * **Regular Investigation:** Every 18 months.
  * Approval granted for master's programs after completion of 2 cycles of master's degree completion with temporary approval

***

**Approval Fees for Establishing Educational Institutions**

**1. Consent Fees for New Universities/Colleges/Campuses/Teaching Institutions:**

Fees vary based on the geographical area of establishment:

* **Kathmandu, Lalitpur, and Bhaktapur Districts**:
  * **Application Fee**: NPR 20,000
  * **Consent Fee**: NPR 500,000
* **Other Metropolitan Cities and within 10 km of Sub-Metropolitan Areas**:
  * **Application Fee**: NPR 12,000
  * **Consent Fee**: NPR 300,000
* **Other Municipalities and within 10 km of their boundaries**:
  * **Application Fee**: NPR 9,000
  * **Consent Fee**: NPR 100,000
* **Rural and Remote Areas**:
  * **Application Fee**: NPR 5,000
  * **Consent Fee**: None

**2. Program Approval Application Fees**

For new universities, colleges, campuses, institutions, or additional programs:

* **Fee for increasing student capacity in approved programs**: NPR 200 per student.
* **Inspection and Monitoring Fee:**
  * Educational institutions must pay the specified fee for inspection and monitoring, requiring at least three inspectors per visit.
  * Fees must be deposited into the council's bank account.
    * **Base Fee**: NPR 50,000
    * **Additional Fee**: NPR 10,000 per 48 students of approved class capacity
* **Approval Fees (For Additional Programs or Increased Student Capacity):**
  * **Temporary Approval Fee**:
    * NPR 300 per approved seat (one-time fee).
  * **Permanent Approval Fee**:
    * NPR 500 per approved seat (one-time fee).

**3. Student Enrollment Fee**

After student enrollment, institutions must pay NPR 1,000 per student as a one-time fee.

***

### 6. Challenges Faced by NEC

Despite its contributions, the NEC faces several challenges, such as:

* **Limited Resources**: Ensuring compliance and monitoring all engineering practices across Nepal requires substantial resources, which are sometimes lacking.
* **Rapid Technological Changes**: Keeping up with advancements in technology and engineering practices can be difficult.
* **Globalization**: Ensuring that Nepalese engineers remain competitive in the global market while adhering to local regulations.
* **Awareness**: Some engineers and institutions may not fully understand the importance of NEC accreditation and registration.

***

### 7. NEC’s Role in the Future

To address these challenges and enhance its effectiveness, NEC aims to:

* Digitize its registration and accreditation processes for greater efficiency.
* Collaborate with international engineering councils to align standards and practices.
* Promote research and innovation in engineering fields.
* Strengthen enforcement of regulations to ensure compliance.

***

### **Conclusion**

The **Nepal Engineering Council (NEC)** is essential for regulating the engineering profession in Nepal. By enforcing standards, licensing engineers, and accrediting education programs, the NEC ensures that engineering practices contribute to national development while prioritizing safety, quality, and professionalism. As Nepal continues to grow and modernize, the NEC's role in fostering competent and ethical engineering practices will remain crucial.

---