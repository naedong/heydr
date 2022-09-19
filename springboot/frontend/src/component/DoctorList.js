import React from "react";
import drImg from "../img/doctor.png";

const DoctorList = (props) => {
  return (
    // if(props)
    <div className="d-flex justify-content-center mt-4">
      <div className="card">
        <div className="row g-0">
          <div className="col-md-3 text-center">
            <img src={drImg} className="img-fluid p-3" alt="..." />
          </div>
          <div className="col-md-9">
            <div className="card-body">
              <h5 className="card-title">
                <strong>{props.doctor.dname} 의사</strong>
                <span>진료가능</span>
              </h5>
              <p className="card-text">{props.doctor.hospitalVO[0].hname}</p>
              <p className="card-text">
                <small className="text-muted">
                  <i className="bi bi-clock"></i>{" "}
                  {props.doctor.hospitalVO[0].otime}~
                  {props.doctor.hospitalVO[0].ctime}
                </small>
              </p>
              <div className="d-flex flex-start">
                <button className="btn btn-primary me-1 disabled" type="button">
                  {props.doctor.dmajor}
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default DoctorList;
