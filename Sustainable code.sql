-- Create CropTypes Table
CREATE TABLE CropTypes (
	CropTypeID INT PRIMARY KEY,
	CropTypeName VARCHAR(100) NOT NULL
);

-- Create Farmers Table
CREATE TABLE Farmers (
	FarmerID INT PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Location VARCHAR(255),
	ContactInfo VARCHAR(100)
);
-- Create Plots Table
CREATE TABLE Plots (
	PlotID INT PRIMARY KEY,
	FarmerID INT NOT NULL,
	Size FLOAT,
	Location VARCHAR(255),
	FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
	ON DELETE CASCADE
);
-- Create Crops Table
CREATE TABLE Crops (
	CropID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	CropTypeID INT NOT NULL,
	PlantingDate DATE,
	HarvestingDate DATE,
	IsDiversified BOOLEAN DEFAULT FALSE,
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE,
	FOREIGN KEY (CropTypeID) REFERENCES CropTypes(CropTypeID)
	ON DELETE CASCADE
);
-- Create Practices Table
CREATE TABLE Practices (
	PracticeID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	PracticeType VARCHAR(100) NOT NULL,
	StartDate DATE,
	Description TEXT,
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE
);
-- Create SoilHealthMonitoring Table
CREATE TABLE SoilHealthMonitoring (
	MonitoringID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	MonitoringDate DATE NOT NULL,
	SoilPH FLOAT,
	OrganicMatter FLOAT,
	ErosionLevel VARCHAR(50),
	Notes TEXT,
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE
);
-- Create Profit Table
CREATE TABLE Profit (
	ProfitID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	Year INT NOT NULL,
	Revenue FLOAT NOT NULL,
	Cost FLOAT NOT NULL,
	Profit FLOAT GENERATED ALWAYS AS (Revenue - Cost) STORED,
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE
);
-- Create Yield Table
CREATE TABLE Yield (
	YieldID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	CropID INT NOT NULL,
	Year INT NOT NULL,
	TotalYield FLOAT NOT NULL,
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE,
	FOREIGN KEY (CropID) REFERENCES Crops(CropID)
	ON DELETE CASCADE
);
-- Create Inventory Table
CREATE TABLE Inventory (
	InventoryID INT PRIMARY KEY,
	PlotID INT NOT NULL,
	ItemName VARCHAR(100) NOT NULL,
	Quantity FLOAT,
	Unit VARCHAR(50),
	FOREIGN KEY (PlotID) REFERENCES Plots(PlotID)
	ON DELETE CASCADE
);

-- Add Indexes for Optimization
CREATE INDEX idx_farmer_location ON Farmers (Location);
CREATE INDEX idx_plot_size ON Plots (Size);
CREATE INDEX idx_crop_type ON Crops (CropTypeID);

-- Insert crop types
INSERT INTO CropTypes (CropTypeID, CropTypeName)
VALUES (1, 'Maize'),
	(2, 'Beans');

-- Insert farmers
INSERT INTO Farmers (FarmerID, Name, Location, ContactInfo)
VALUES (1, 'John Doe', 'Village A', '123-456-7890'),
	(2, 'Jane Smith', 'Village B', '987-654-3210'),
	(3, 'Michael Johnson', 'Village C', '555-555-5555');

-- Insert plots
INSERT INTO Plots (PlotID, FarmerID, Size, Location)
VALUES (1, 1, 2.5, 'North of Village A'),
	(2, 2, 3.0, 'South of Village B'),
	(3, 3, 1.8, 'East of Village C');
-- Insert crops
INSERT INTO Crops (CropID, PlotID, CropTypeID, PlantingDate, HarvestingDate, IsDiversified)
VALUES (1, 1, 1, '2024-03-01', '2024-07-15', TRUE),
	(2, 2, 2, '2024-04-01', '2024-08-15', FALSE),
	(3, 3, 1, '2024-05-01', '2024-09-15', TRUE);
-- Insert practices
INSERT INTO Practices (PracticeID, PlotID, PracticeType, StartDate, Description)
VALUES (1, 1, 'Crop Rotation', '2024-02-15', 'Rotated maize with beans.'),
	(2, 2, 'Cover Cropping', '2024-03-15', 'Planted cover crops to improve soil health.'),
	(3, 3, 'Integrated Pest Management', '2024-04-15', 'Used biological controls to manage pests.');

-- Insert soil health monitoring records
INSERT INTO SoilHealthMonitoring (MonitoringID, PlotID, MonitoringDate, SoilPH, OrganicMatter, ErosionLevel, Notes)
VALUES (1, 1, '2024-06-20', 6.5, 4.2, 'Low', 'Healthy soil with good organic content.'),
	(2, 2, '2024-07-20', 6.8, 3.8, 'Medium', 'Improving soil quality through sustainable practices.'),
	(3, 3, '2024-08-20', 6.2, 4.5, 'Low', 'Implementing erosion control measures.');
-- Insert profit records
INSERT INTO Profit (ProfitID, PlotID, Year, Revenue, Cost)
VALUES (1, 1, 2024, 5000, 3000),
	(2, 2, 2024, 6000, 3500),
	(3, 3, 2024, 4000, 2500);
-- Insert yield records
INSERT INTO Yield (YieldID, PlotID, CropID, Year, TotalYield)
VALUES (1, 1, 1, 2024, 3.2),
	(2, 2, 2, 2024, 4.5),
	(3, 3, 1, 2024, 2.8);
-- Insert inventory records
INSERT INTO Inventory (InventoryID, PlotID, ItemName, Quantity, Unit)
VALUES (1, 1, 'Maize Seeds', 50, 'kg'),
	(2, 2, 'Bean Seeds', 30, 'kg'),
	(3, 3, 'Maize Seeds', 40, 'kg');
	
-- Insert more crop types
	INSERT INTO CropTypes (CropTypeID, CropTypeName)
	VALUES (3, 'Wheat'),
		(4, 'Rice'),
		(5, 'Potato');

	-- Insert more farmers
	INSERT INTO Farmers (FarmerID, Name, Location, ContactInfo)
	VALUES (4, 'Sarah Johnson', 'Village D', '111-222-3333'),
		(5, 'David Wilson', 'Village E', '444-555-6666');
-- Insert more plots
	INSERT INTO Plots (PlotID, FarmerID, Size, Location)
	VALUES (4, 4, 2.0, 'West of Village D'),
		(5, 5, 3.5, 'North of Village E');













